package edu.skku.grabtable.reservation.service;

import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final UserRepository userRepository;


    public Reservation createNewReservation(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        //사용자가 이미 예약의 호스트인지
        if (reservationRepository.existsByHostId(userId)) {
            throw new BadRequestException(ExceptionCode.ALREADY_HOSTING_USER);
        }

        //사용자가 다른 예약에 참여중인지
        if (user.getInvitedReservation() != null) {
            throw new BadRequestException(ExceptionCode.ALREADY_INVITED_USER);
        }

        Reservation reservation = new Reservation(user);
        reservationRepository.save(reservation);

        return reservation;
    }

    public void joinExistingReservation(Long userId, String inviteCode) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        Reservation reservation = reservationRepository.findByInviteCode(inviteCode)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_RESERVATION_ID));

        user.joinReservation(reservation);
    }
}
