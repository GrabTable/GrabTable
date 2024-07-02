package edu.skku.grabtable.order.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.OrderStatus;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.order.repository.SharedOrderRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.domain.StoreCategory;
import edu.skku.grabtable.store.domain.StoreStatus;
import edu.skku.grabtable.user.domain.User;
import java.util.ArrayList;
import java.util.List;
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
class SharedOrderServiceTest {

    @Mock
    OrderRepository orderRepository;

    @Mock
    ReservationRepository reservationRepository;

    @Mock
    SharedOrderRepository sharedOrderRepository;

    @Mock
    CartRepository cartRepository;

    @Mock
    PaymentValidator paymentValidator;

    @InjectMocks
    SharedOrderService sharedOrderService;

    @Test
    @DisplayName("사용자가 공유 주문을 결제할 수 있다.")
    void processPayment() {
        //given
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>(), new ArrayList<>());
        Reservation reservation = new Reservation(user, store);
        SharedOrder sharedOrder = reservation.getSharedOrder();
        Cart cart = new Cart(1L, null, "coke", 2000, null, sharedOrder, 1);
        sharedOrder.getCarts().add(cart);
        PaymentRequest paymentRequest = new PaymentRequest("impUid", 2000);

        given(reservationRepository.findOngoingReservationByUser(any()))
                .willReturn(Optional.of(reservation));
        given(sharedOrderRepository.findByReservation(any()))
                .willReturn(Optional.of(sharedOrder));
        given(cartRepository.findBySharedOrderId(any()))
                .willReturn(List.of(cart));

        //when
        OrderResponse response = sharedOrderService.processPayment(user, paymentRequest);

        //then
        assertThat(response.getUserId()).isOne();
        assertThat(response.getPaidAmount()).isEqualTo(2000);
        assertThat(response.getStatus()).isEqualTo(OrderStatus.PAID.toString());

    }

    @Test
    @DisplayName("사용자가 예약이 없을 시 결제에 실패한다.")
    void processPayment_fail() {
        //given
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        PaymentRequest paymentRequest = new PaymentRequest("impUid", 2000);

        given(reservationRepository.findOngoingReservationByUser(any()))
                .willReturn(Optional.empty());

        //when & then
        assertThatThrownBy(() -> sharedOrderService.processPayment(user, paymentRequest))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining(ExceptionCode.NO_RESERVATION_USER.getMessage());
    }

    @Test
    @DisplayName("잔여 금액보다 많은 금액을 결제 시 실패한다.")
    void processPayment_fail2() {
        //given
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>(), new ArrayList<>());
        Reservation reservation = new Reservation(user, store);
        SharedOrder sharedOrder = reservation.getSharedOrder();
        Cart cart = new Cart(1L, null, "coke", 2000, null, sharedOrder, 1);
        PaymentRequest paymentRequest = new PaymentRequest("impUid", 20000);

        given(reservationRepository.findOngoingReservationByUser(any()))
                .willReturn(Optional.of(reservation));
        given(sharedOrderRepository.findByReservation(any()))
                .willReturn(Optional.of(sharedOrder));
        given(cartRepository.findBySharedOrderId(any()))
                .willReturn(List.of(cart));

        //when & then
        assertThatThrownBy(() -> sharedOrderService.processPayment(user, paymentRequest))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("지불 요청 금액이 잔여 금액보다 많습니다.");
    }


}