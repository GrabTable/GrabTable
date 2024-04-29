package edu.skku.grabtable.order.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.response.OrderResponse;
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

    public OrderResponse create(User user) {
        Reservation invitedReservation = user.getInvitedReservation();
        if (invitedReservation != null) {
            return buildOrderResponse(user, invitedReservation);
        }

        Reservation reservation = reservationRepository.findByHostId(user.getId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        return buildOrderResponse(user, reservation);
    }

    private OrderResponse buildOrderResponse(User user, Reservation reservation) {
        List<Cart> carts = cartRepository.findByUserId(user.getId());
        if (carts.isEmpty()) {
            throw new BadRequestException(ExceptionCode.NOT_EXIST_CURRENT_CART);
        }
        Order order = new Order(user, reservation, carts);
        orderRepository.save(order);
        return OrderResponse.of(order);
    }
}
