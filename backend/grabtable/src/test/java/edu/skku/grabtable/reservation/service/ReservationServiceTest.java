package edu.skku.grabtable.reservation.service;

import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;

import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.domain.ReservationStatus;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.domain.StoreCategory;
import edu.skku.grabtable.store.domain.StoreStatus;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import java.util.ArrayList;
import java.util.Optional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.transaction.annotation.Transactional;

@ExtendWith(MockitoExtension.class)
@Transactional
class ReservationServiceTest {

    @Mock
    ReservationRepository reservationRepository;

    @Mock
    UserRepository userRepository;

    @Mock
    StoreRepository storeRepository;

    @InjectMocks
    ReservationService reservationService;

    @Test
    @DisplayName("기존 예약의 호스트가 새로운 예약 생성 시 실패한다.")
    void host_create_fail() {
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        Store store = new Store(1L, "storeA", "Seoul", "url", "phone", "desc", StoreStatus.VALID,
                StoreCategory.JAPANESE,
                new ArrayList<>(), new ArrayList<>());

        given(storeRepository.findById(any()))
                .willReturn(Optional.of(store));

        //when
        given(reservationRepository.existsByHostId(any()))
                .willReturn(true);

        //then
        assertThatThrownBy(() -> reservationService.createNewReservation(user, store.getId()))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("이미 예약을 생성한 유저입니다.");
    }

    @Test
    @DisplayName("기존 예약의 호스트가 새로운 예약 참여 시 실패한다.")
    void host_participate_fail() {
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        Store store = new Store(1L, "storeA", "Seoul", "url", "phone", "desc", StoreStatus.VALID,
                StoreCategory.JAPANESE,
                new ArrayList<>(), new ArrayList<>());
        Reservation reservation = new Reservation(user, store);

        given(reservationRepository.findByInviteCode(any()))
                .willReturn(Optional.of(reservation));
        given(reservationRepository.existsByHostId(any()))
                .willReturn(true);

        //then
        assertThatThrownBy(() -> reservationService.joinExistingReservation(user, reservation.getInviteCode()))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("이미 예약을 생성한 유저입니다.");
    }

    @Test
    @DisplayName("기존 예약의 참여자가 새로운 예약 생성 시 실패한다.")
    void invitee_create_fail() {
        Reservation reservation = new Reservation(1L, null, null, null, null, ReservationStatus.ONGOING);
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", reservation, new ArrayList<>(),
                new ArrayList<>());
        Store store = new Store(1L, "storeA", "Seoul", "url", "phone", "desc", StoreStatus.VALID,
                StoreCategory.JAPANESE,
                new ArrayList<>(), new ArrayList<>());

        given(reservationRepository.existsByHostId(any()))
                .willReturn(false);
        given(storeRepository.findById(any()))
                .willReturn(Optional.of(store));

        assertThatThrownBy(() -> reservationService.createNewReservation(user, 1L))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("이미 예약에 초대된 유저입니다.");

    }

    @Test
    @DisplayName("기존 예약의 참여자가 다른 예약에 참여 시도 시 실패한다")
    void invitee_participate_fail() {
        Reservation reservation = new Reservation(1L, null, null, null, null, ReservationStatus.ONGOING);
        Reservation reservation2 = new Reservation(2L, null, null, null, null, ReservationStatus.ONGOING);
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", reservation, new ArrayList<>(),
                new ArrayList<>());
        Store store = new Store(1L, "storeA", "Seoul", "url", "phone", "desc", StoreStatus.VALID,
                StoreCategory.JAPANESE,
                new ArrayList<>(), new ArrayList<>());

        given(reservationRepository.findByInviteCode(any()))
                .willReturn(Optional.of(reservation2));

        assertThatThrownBy(() -> reservationService.joinExistingReservation(user, "inviteCode"))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("이미 예약에 초대된 유저입니다.");

    }
}