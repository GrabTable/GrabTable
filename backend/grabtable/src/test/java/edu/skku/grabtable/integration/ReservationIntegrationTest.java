package edu.skku.grabtable.integration;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.order.service.OrderService;
import edu.skku.grabtable.order.service.SharedOrderService;
import edu.skku.grabtable.reservation.domain.ReservationHistory;
import edu.skku.grabtable.reservation.repository.ReservationHistoryRepository;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.reservation.service.ReservationService;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class ReservationIntegrationTest {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ReservationService reservationService;

    @Autowired
    StoreRepository storeRepository;

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    EntityManager em;

    @Autowired
    CartService cartService;

    @Autowired
    OrderService orderService;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    SharedOrderService sharedOrderService;

    @MockBean
    PaymentValidator validator;

    @Autowired
    ReservationHistoryRepository reservationHistoryRepository;

    @Test
    @DisplayName("호스트가 예약을 취소하면 예약의 모든 참여자의 예약 상태가 취소된다.")
    void host_cancel_propagate() {
        //given
        User host = User.builder()
                .username("host")
                .build();

        User userA = User.builder()
                .username("userA")
                .build();

        Store store = new Store("storeA", "addr");

        userRepository.save(host);
        userRepository.save(userA);
        storeRepository.save(store);

        reservationService.createNewReservation(host, store.getId());
        String inviteCode = reservationService.findOngoingReservationByUser(host).getInviteCode();
        reservationService.joinExistingReservation(userA, inviteCode);

        //when
        em.flush();
        em.clear();
        reservationService.cancel(host);

        //then
        assertThatThrownBy(() -> reservationService.findOngoingReservationByUser(host))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining(ExceptionCode.NO_RESERVATION_USER.getMessage());

        assertThatThrownBy(() -> reservationService.findOngoingReservationByUser(userA))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining(ExceptionCode.NO_RESERVATION_USER.getMessage());

        ReservationHistory reservationHistory = reservationHistoryRepository.findByHost(host).get();
        assertThat(reservationRepository.existsByHostId(host.getId())).isFalse();
        assertThat(reservationHistory.getHost().getId()).isEqualTo(host.getId());
        assertThat(reservationHistory.getInvitedReservationHistories().size()).isEqualTo(1);
    }

    @Test
    @DisplayName("호스트가 아닌 참여자가 예약을 취소하면 해당 참여자는 예약에서 빠지고, 예약은 유지된다.")
    void invitee_cancel_remain() {
        //given
        User host = User.builder()
                .username("host")
                .build();

        User userA = User.builder()
                .username("userA")
                .build();

        Store store = Store.builder()
                .storeName("storeA")
                .build();

        userRepository.save(host);
        userRepository.save(userA);
        storeRepository.save(store);

        reservationService.createNewReservation(host, store.getId());
        String inviteCode = reservationService.findOngoingReservationByUser(host).getInviteCode();
        reservationService.joinExistingReservation(userA, inviteCode);

        //when
        reservationService.cancel(userA);

        //then
        assertThat(reservationService.findOngoingReservationByUser(host)).isNotNull();

        assertThatThrownBy(() -> reservationService.findOngoingReservationByUser(userA))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining(ExceptionCode.NO_RESERVATION_USER.getMessage());
    }

    @Test
    @DisplayName("모든 참여자가 주문 완료 상태라면 예약 확정에 성공한다.")
    void confirm_reservation() {
        //given
        User host = User.builder()
                .username("host")
                .build();

        User userA = User.builder()
                .username("userA")
                .build();

        Store store = Store.builder()
                .storeName("storeA")
                .build();

        int menuPrice = 1000;

        Menu menuA = Menu.builder()
                .store(store)
                .menuName("menuA")
                .price(menuPrice)
                .build();

        userRepository.save(host);
        userRepository.save(userA);
        storeRepository.save(store);
        menuRepository.save(menuA);

        reservationService.createNewReservation(host, store.getId());
        String inviteCode = reservationService.findOngoingReservationByUser(host).getInviteCode();
        reservationService.joinExistingReservation(userA, inviteCode);

        cartService.createCart(host, menuA.getId(), 1);
        cartService.createCart(userA, menuA.getId(), 1);

        //when
        orderService.processPayment(host, new PaymentRequest("1", menuPrice));
        orderService.processPayment(userA, new PaymentRequest("1", menuPrice));
        em.flush();
        em.clear();
        reservationService.confirmCurrentReservation(host);

        //then
        ReservationHistory reservationHistory = reservationHistoryRepository.findByHost(host).get();
        assertThat(reservationRepository.existsByHostId(host.getId())).isFalse();
        assertThat(reservationHistory.getHost().getId()).isEqualTo(host.getId());
        assertThat(reservationHistory.getInvitedReservationHistories().size()).isEqualTo(1);
    }

    @Test
    @DisplayName("예약에서 결제된 공유 주문과 개인 주문의 개수 합이 0개라면 예약 확정에 실패한다.")
    void if_allOrdersCountIsZero_then_confirmReservation_fail() {
        //given
        User host = User.builder()
                .username("host")
                .build();

        User userA = User.builder()
                .username("userA")
                .build();

        Store store = Store.builder()
                .storeName("storeA")
                .build();

        int menuPrice = 1000;

        Menu menuA = Menu.builder()
                .store(store)
                .menuName("menuA")
                .price(menuPrice)
                .build();

        userRepository.save(host);
        userRepository.save(userA);
        storeRepository.save(store);
        menuRepository.save(menuA);

        reservationService.createNewReservation(host, store.getId());
        String inviteCode = reservationService.findOngoingReservationByUser(host).getInviteCode();
        reservationService.joinExistingReservation(userA, inviteCode);

        cartService.createCart(host, menuA.getId(), 1);
        cartService.createCart(userA, menuA.getId(), 1);

        //when & then
        assertThatThrownBy(() -> reservationService.confirmCurrentReservation(host))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining(ExceptionCode.NO_ORDER_FOUND_IN_RESERVATION.getMessage());

    }

    @Test
    @DisplayName("공유 주문 잔여 금액이 0원이 아니라면 예약 확정에 실패한다.")
    void if_sharedOrderLeftAmountIsNotZero_then_confirmReservation_fail() {
        //given
        User host = User.builder()
                .username("host")
                .build();

        User userA = User.builder()
                .username("userA")
                .build();

        Store store = Store.builder()
                .storeName("storeA")
                .build();

        int menuPrice = 1000;

        Menu menuA = Menu.builder()
                .store(store)
                .menuName("menuA")
                .price(menuPrice)
                .build();

        userRepository.save(host);
        userRepository.save(userA);
        storeRepository.save(store);
        menuRepository.save(menuA);

        reservationService.createNewReservation(host, store.getId());
        String inviteCode = reservationService.findOngoingReservationByUser(host).getInviteCode();
        reservationService.joinExistingReservation(userA, inviteCode);

        cartService.createCartInSharedOrder(host, menuA.getId(), 1);

        em.flush();
        em.clear();

        //when
        //전체 금액의 절반만 결제
        sharedOrderService.processPayment(host, new PaymentRequest("1", menuPrice / 2));

        //then
        //예약 확정 시도
        assertThatThrownBy(() -> reservationService.confirmCurrentReservation(host))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining(ExceptionCode.UNPAID_AMOUNT_EXIST.getMessage());
    }

    // TODO invitee - reservation 연관관계 수정 후 테스트
//    @Test
//    @DisplayName("가장 최근에 확정한 예약을 조회할 수 있다.")
//    void read_last_recently_confirmed_reservation() {
//        //given
//        User host = User.builder()
//                .username("host")
//                .build();
//
//        User userA = User.builder()
//                .username("userA")
//                .build();
//
//        Store store = Store.builder()
//                .storeName("storeA")
//                .build();
//
//        int menuPrice = 1000;
//
//        Menu menuA = Menu.builder()
//                .store(store)
//                .menuName("menuA")
//                .price(menuPrice)
//                .build();
//
//        userRepository.save(host);
//        userRepository.save(userA);
//        storeRepository.save(store);
//        menuRepository.save(menuA);
//
//        reservationService.createNewReservation(host, store.getId());
//        String inviteCode = reservationService.findOngoingReservationByUser(host).getInviteCode();
//        reservationService.joinExistingReservation(userA, inviteCode);
//
//        cartService.createCart(host, menuA.getId(), 1);
//        cartService.createCart(userA, menuA.getId(), 1);
//
//        orderService.processPayment(host, new PaymentRequest("1", menuPrice));
//        orderService.processPayment(userA, new PaymentRequest("1", menuPrice));
//
//        reservationService.confirmCurrentReservation(host);
//
//        //when
//        Reservation hostLastConfirmed = reservationRepository.findLastRecentlyConfirmedReservationByUserId(host.getId())
//                .orElseThrow();
//        Reservation userALastConfirmed = reservationRepository.findLastRecentlyConfirmedReservationByUserId(
//                userA.getId()).orElseThrow();
//
//        //then
//        assertThat(hostLastConfirmed).isEqualTo(userALastConfirmed);
//    }

}
