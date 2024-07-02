package edu.skku.grabtable.order.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.user.domain.User;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class SharedOrderService {
    private final OrderRepository orderRepository;
    private final ReservationRepository reservationRepository;
    private final CartRepository cartRepository;
    private final PaymentValidator validator;

    public OrderResponse processPayment(User user, PaymentRequest paymentRequest) {
        Reservation reservation = reservationRepository.findOngoingReservationByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = reservation.getSharedOrder();
        validateSharedCarts(sharedOrder);
        validatePayingAmount(paymentRequest.getAmount(), sharedOrder.calculateLeftAmount());
        validator.verify(paymentRequest);
        return buildOrderResponse(user, sharedOrder, paymentRequest.getAmount());
    }

    private OrderResponse buildOrderResponse(User user, SharedOrder sharedOrder, int amount) {
        Order order = new Order(user, sharedOrder, amount);
        orderRepository.save(order);
        return OrderResponse.of(order);
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
