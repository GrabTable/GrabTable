package edu.skku.grabtable.reservation.service;

import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.StoreRepository;
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


    public void createNewReservation(Long userId, Long storeId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));

        if (reservationRepository.existsByHostId(userId)) {
            throw new BadRequestException(ExceptionCode.ALREADY_HOSTING_USER);
        }

        if (user.getInvitedReservation() != null) {
            throw new BadRequestException(ExceptionCode.ALREADY_INVITED_USER);
        }

        Reservation reservation = new Reservation(user, store);
        reservationRepository.save(reservation);
    }

    public void joinExistingReservation(Long userId, String inviteCode) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        Reservation reservation = reservationRepository.findByInviteCode(inviteCode)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_RESERVATION_ID));

        if (reservationRepository.existsByHostId(userId)) {
            throw new BadRequestException(ExceptionCode.ALREADY_HOSTING_USER);
        }

        if (user.getInvitedReservation() != null) {
            throw new BadRequestException(ExceptionCode.ALREADY_INVITED_USER);
        }

        user.joinReservation(reservation);
    }

    public ReservationDetailResponse findByUserId(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        if (user.getInvitedReservation() != null) {
            return ReservationDetailResponse.of(user.getInvitedReservation());
        }

        Reservation reservation = reservationRepository.findByHostId(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        return ReservationDetailResponse.of(reservation);
    }

    public void cancel(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        if (user.getInvitedReservation() != null) {
            user.clearReservation();
            return;
        }

        Reservation reservation = reservationRepository.findByHostId(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        reservationRepository.delete(reservation);

        List<User> invitees = userRepository.findByInvitedReservation(reservation);
        for (User invitee : invitees) {
            invitee.clearCarts();
            invitee.clearReservation();
        }
    }

    public void confirmCurrentReservation(Long userId) {
        Reservation reservation = reservationRepository.findByHostId(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        //예약의 모든 사용자의 현재 주문이 존재하는지 검사
        //TODO

        //예약을 확정 처리
        reservation.confirm();

        //invitee들의 예약 연관관계 해제
        List<User> invitees = userRepository.findByInvitedReservation(reservation);
        for (User invitee : invitees) {
            invitee.clearReservation();
        }
    }
}
