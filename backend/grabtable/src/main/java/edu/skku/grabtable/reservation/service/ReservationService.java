package edu.skku.grabtable.reservation.service;

import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final StoreRepository storeRepository;
    private final UserRepository userRepository;
    private final OrderRepository orderRepository;


    public void createNewReservation(User user, Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));

        if (reservationRepository.existsByHostId(user.getId())) {
            throw new BadRequestException(ExceptionCode.ALREADY_HOSTING_USER);
        }

        if (user.getInvitedReservation() != null) {
            throw new BadRequestException(ExceptionCode.ALREADY_INVITED_USER);
        }

        Reservation reservation = new Reservation(user, store);
        reservationRepository.save(reservation);
    }

    public void joinExistingReservation(User user, String inviteCode) {
        Reservation reservation = reservationRepository.findByInviteCode(inviteCode)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_RESERVATION_ID));

        if (reservationRepository.existsByHostId(user.getId())) {
            throw new BadRequestException(ExceptionCode.ALREADY_HOSTING_USER);
        }

        if (user.getInvitedReservation() != null) {
            throw new BadRequestException(ExceptionCode.ALREADY_INVITED_USER);
        }

        user.joinReservation(reservation);
        userRepository.save(user);
    }

    public ReservationDetailResponse findReservationByUser(User user) {
        Reservation reservation = user.getInvitedReservation();

        if (reservation != null) {
            List<OrderResponse> orders = orderRepository.findByReservation(reservation)
                    .stream()
                    .map(OrderResponse::of)
                    .toList();
            return ReservationDetailResponse.of(reservation, orders);
        }

        reservation = reservationRepository.findByHostId(user.getId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        List<OrderResponse> orders = orderRepository.findByReservation(reservation)
                .stream()
                .map(OrderResponse::of)
                .toList();
        return ReservationDetailResponse.of(reservation, orders);
    }

    public void cancel(User user) {
        if (user.getInvitedReservation() != null) {
            user.clearReservation();
            return;
        }

        Reservation reservation = reservationRepository.findByHostId(user.getId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        reservationRepository.delete(reservation);

        List<User> invitees = userRepository.findByInvitedReservation(reservation);
        for (User invitee : invitees) {
            invitee.clearCarts();
            invitee.clearReservation();
        }
    }

    public void confirmCurrentReservation(User user) {
        Reservation reservation = reservationRepository.findByHostId(user.getId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        //예약의 모든 사용자의 현재 주문이 존재하는지 검사
        List<User> invitees = userRepository.findByInvitedReservation(reservation);
        List<Order> orders = orderRepository.findByReservation(reservation);
        validateLengthOfInviteesAndOrders(invitees, orders);

        //예약을 확정 처리
        reservation.confirm();

        //invitee들의 예약 연관관계 해제
        for (User invitee : invitees) {
            invitee.clearReservation();
        }
    }

    private void validateLengthOfInviteesAndOrders(List<User> invitees, List<Order> orders) {
        if (invitees.size() + 1 != orders.size()) {
            throw new BadRequestException(ExceptionCode.NOT_ENOUGH_ORDER);
        }
    }

    public List<OrderResponse> findAllOrdersByReservationId(Long reservationId) {
        Reservation reservation = reservationRepository.findById(reservationId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_RESERVATION_ID));
        List<Order> orders = orderRepository.findByReservation(reservation);
        return orders.stream().map(OrderResponse::of).toList();
    }
}
