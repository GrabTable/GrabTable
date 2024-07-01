package edu.skku.grabtable.order.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.domain.ReservationStatus;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
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
class OrderServiceTest {

    @Mock
    OrderRepository orderRepository;

    @Mock
    ReservationRepository reservationRepository;

    @Mock
    CartRepository cartRepository;

    @Mock
    PaymentValidator paymentValidator;

    @InjectMocks
    OrderService orderService;

    @Test
    @DisplayName("유저의 카트를 기반으로 주문을 생성할 수 있다.")
    void createOrder() {
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        Cart cart = new Cart(1L, user, "coke", 2000, null, null, 1);
        cartRepository.save(cart);
        Reservation reservation = new Reservation(1L, user, null, null, null, "code", ReservationStatus.ONGOING);
        PaymentRequest paymentRequest = new PaymentRequest("impUid", 2000);
        //given
        given(reservationRepository.findByUser(any()))
                .willReturn(Optional.of(reservation));
        given(cartRepository.findByUserId(any()))
                .willReturn(List.of(cart));

        //when
        OrderResponse orderResponse = orderService.processPayment(user, paymentRequest);

        //then
        assertThat(orderResponse.getStatus()).isEqualTo("PAID");
    }

    @Test
    @DisplayName("유저의 카트가 존재하지 않는다면 주문 생성 시 실패한다.")
    void createOrder_fail_ifEmptyCart() {
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        Reservation reservation = new Reservation(1L, user, null, null, null, "code", ReservationStatus.ONGOING);
        PaymentRequest paymentRequest = new PaymentRequest("impUid", 10000);

        //given
        given(reservationRepository.findByUser(any()))
                .willReturn(Optional.of(reservation));
        given(cartRepository.findByUserId(any()))
                .willReturn(List.of());
        //when,
        assertThatThrownBy(() -> orderService.processPayment(user, paymentRequest))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("사용자의 장바구니가 비어 있습니다.");
    }
}