package edu.skku.grabtable.reservation.service;

import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ReservationServiceTest {

    @Autowired
    ReservationService reservationService;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    UserRepository userRepository;

    @Test
    @DisplayName("신규 예약을 생성한다.")
    void createNewReservation() {
        //given
        User user = new User("userA", "1234", "email", "phone");
        userRepository.save(user);
        Reservation newReservation = reservationService.createNewReservation(user.getId());

        System.out.println("newReservation.getHost() = " + newReservation.getHost());
        System.out.println("newReservation.getSharedOrder() = " + newReservation.getSharedOrder().getId());
        System.out.println("newReservation.getInviteCode() = " + newReservation.getInviteCode());
    }

    @Test
    @DisplayName("초대 코드를 입력하여 존재하는 예약에 참여 요청을 보낼 수 있다.")
    void requestParticipateExisting() {
        User user = new User("userA", "1234", "email", "phone");
        userRepository.save(user);
        Reservation newReservation = reservationService.createNewReservation(user.getId());
        String inviteCode = newReservation.getInviteCode();
        User user2 = new User("userB", "1234", "email", "phone");
        userRepository.save(user2);

        //when
        reservationService.joinExistingReservation(user2.getId(), inviteCode);

        //then
        User findUser = userRepository.findById(user2.getId()).get();
        Assertions.assertThat(findUser.getInvitedReservation().getId()).isEqualTo(newReservation.getId());
    }
}