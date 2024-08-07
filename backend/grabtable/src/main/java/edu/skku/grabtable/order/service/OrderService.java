package edu.skku.grabtable.order.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
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
public class OrderService {

    private final OrderRepository orderRepository;
    private final ReservationRepository reservationRepository;
    private final CartRepository cartRepository;
    private final PaymentValidator validator;

    public OrderResponse processPayment(User user, PaymentRequest paymentRequest) {
        Reservation reservation = reservationRepository.findOngoingReservationByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        validateSameAmount(user, paymentRequest.getAmount());
        validator.verify(paymentRequest);
        return buildOrderResponse(user, reservation);
    }

    private OrderResponse buildOrderResponse(User user, Reservation reservation) {
        List<Cart> carts = cartRepository.findByUserId(user.getId());
        Order order = new Order(user, reservation, carts);
        orderRepository.save(order);
        return OrderResponse.from(order);
    }

    private void validateSameAmount(User user, int requestedAmount) {
        List<Cart> carts = cartRepository.findByUserId(user.getId());
        if (carts.isEmpty()) {
            throw new BadRequestException(ExceptionCode.CURRENT_CARTS_EMPTY);
        }

        int actualAmount = carts.stream()
                .mapToInt(Cart::calculateTotalPrice)
                .sum();

        if (actualAmount != requestedAmount) {
            throw new BadRequestException(ExceptionCode.INVALID_PAY_AMOUNT);
        }
    }
}
