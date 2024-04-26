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
}
