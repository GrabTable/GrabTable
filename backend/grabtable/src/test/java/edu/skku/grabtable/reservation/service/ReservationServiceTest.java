package edu.skku.grabtable.reservation.service;

import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;

import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.domain.StoreCategory;
import edu.skku.grabtable.store.domain.StoreStatus;
import edu.skku.grabtable.store.repository.StoreRepository;
import java.util.ArrayList;
import java.util.Optional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentMatchers;
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
    void create_fail() {
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>());
        Store store = new Store(1L, "storeA", "Seoul", "url", "phone", "desc", StoreStatus.VALID,
                StoreCategory.JAPANESE,
                new ArrayList<>(), new ArrayList<>());

        given(userRepository.findById(ArgumentMatchers.any()))
                .willReturn(Optional.of(user));

        given(storeRepository.findById(ArgumentMatchers.any()))
                .willReturn(Optional.of(store));

        //when
        given(reservationRepository.existsByHostId(ArgumentMatchers.any()))
                .willReturn(true);

        //then
        assertThatThrownBy(() -> reservationService.createNewReservation(user.getId(), store.getId()))
                .isInstanceOf(BadRequestException.class);
    }

    @Test
    @DisplayName("기존 예약의 호스트가 새로운 예약 참여 시 실패한다.")
    void participate_fail() {
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>());
        Store store = new Store(1L, "storeA", "Seoul", "url", "phone", "desc", StoreStatus.VALID,
                StoreCategory.JAPANESE,
                new ArrayList<>(), new ArrayList<>());
        Reservation reservation = new Reservation(user, store);

        given(userRepository.findById(ArgumentMatchers.any()))
                .willReturn(Optional.of(user));

        given(reservationRepository.findByInviteCode(ArgumentMatchers.any()))
                .willReturn(Optional.of(reservation));

        //when
        given(reservationRepository.existsByHostId(ArgumentMatchers.any()))
                .willReturn(true);

        //then
        assertThatThrownBy(() -> reservationService.joinExistingReservation(user.getId(), reservation.getInviteCode()))
                .isInstanceOf(BadRequestException.class);
    }
}