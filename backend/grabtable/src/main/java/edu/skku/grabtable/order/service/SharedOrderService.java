package edu.skku.grabtable.order.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.annotation.DistributedLock;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.OrderStatus;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.domain.request.PostPaymentRequest;
import edu.skku.grabtable.order.domain.request.PrePaymentRequest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.order.repository.SharedOrderRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.reservation.service.ReservationService;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class SharedOrderService {
    private final OrderRepository orderRepository;
    private final ReservationRepository reservationRepository;
    private final CartRepository cartRepository;
    private final SharedOrderRepository sharedOrderRepository;
    private final UserRepository userRepository;
    private final PaymentValidator validator;
    private final ReservationService reservationService;

    @Transactional
    public OrderResponse processPayment(User user, PaymentRequest paymentRequest) {
        Reservation reservation = reservationRepository.findOngoingReservationByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = sharedOrderRepository.findByReservation(reservation)
                .orElseThrow();
        validateSharedCarts(sharedOrder);
        validatePayingAmount(paymentRequest.getAmount(), sharedOrder.calculateLeftAmount());
        validator.verify(paymentRequest);
        return buildOrderResponse(user, sharedOrder, paymentRequest.getAmount());
    }

    @DistributedLock(key = "#prePaymentRequest.getReservationId()", waitTime = 0L)
    public OrderResponse prePayment(User user, PrePaymentRequest prePaymentRequest) {
        Reservation reservation = reservationRepository.findOngoingReservationByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = sharedOrderRepository.findByReservation(reservation)
                .orElseThrow();
        validateSharedCarts(sharedOrder);
        validatePayingAmount(prePaymentRequest.getAmount(), sharedOrder.calculateLeftAmount());
        OrderResponse orderResponse = buildPreOrderResponse(user, sharedOrder, prePaymentRequest.getAmount());
        reservationService.sendUpdateEvent(user.getId());
        return orderResponse;
    }

    @Transactional
    public void postPayment(OrderStatus status, User user, PostPaymentRequest postPaymentRequest) {
        Order order = orderRepository.findById(postPaymentRequest.getOrderId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_ORDER_FOUND_IN_RESERVATION));
        if (!user.getId().equals(order.getUser().getId())) {
            throw new BadRequestException(ExceptionCode.INVALID_PAID_USER);
        }
        if (status.equals(OrderStatus.CANCELED)) {
            orderRepository.delete(order);
            return;
        }
        PaymentRequest paymentRequest = new PaymentRequest(postPaymentRequest.getImpUid(),
                postPaymentRequest.getAmount());
        validator.verify(paymentRequest);
        order.finishOrder();
    }

    private OrderResponse buildOrderResponse(User user, SharedOrder sharedOrder, int amount) {
        Order order = sharedOrder.addOrder(user, amount);
        orderRepository.save(order);
        return OrderResponse.from(order);
    }

    private OrderResponse buildPreOrderResponse(User user, SharedOrder sharedOrder, int amount) {
        Order order = sharedOrder.addPreOrder(user, amount);
        orderRepository.save(order);
        return OrderResponse.from(order);
    }

    private void validateSharedCarts(SharedOrder sharedOrder) {
        List<Cart> carts = cartRepository.findBySharedOrderId(sharedOrder.getId());
        if (carts.isEmpty()) {
            throw new BadRequestException(ExceptionCode.CURRENT_CARTS_EMPTY);
        }
    }

    private void validatePayingAmount(int payingAmount, int left) {
        if (payingAmount > left) {
            throw new BadRequestException(ExceptionCode.TOO_MUCH_PAYING_AMOUNT);
        }
    }

}
