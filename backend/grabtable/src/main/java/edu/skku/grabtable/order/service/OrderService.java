package edu.skku.grabtable.order.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
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
    private final UserRepository userRepository;

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
        List<Cart> carts = user.getCarts();
        Order order = new Order(reservation, carts);
        orderRepository.save(order);
        List<CartResponse> cartDTOs = carts.stream().map(CartResponse::of).toList();
        return OrderResponse.of(order, user.getId(), cartDTOs);
    }
}
