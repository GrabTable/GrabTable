package edu.skku.grabtable.integration;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import edu.skku.grabtable.order.service.OrderService;
import edu.skku.grabtable.reservation.service.ReservationService;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.domain.MenuStatus;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class OrderCartIntegrationTest {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StoreRepository storeRepository;

    @Autowired
    private MenuRepository menuRepository;

    @MockBean
    PaymentValidator paymentValidator;

    @Test
    @DisplayName("개인 주문 결제를 완료한 이후 사용자의 장바구니를 비운다.")
    void verifyDisconnectionBetweenUserAndCarts() {
        User user = new User("userA", "pw", "email", "phone");
        Store store = new Store("storeA", "addr");
        Menu menu = new Menu(null, store, "menuA", 1000, null, MenuStatus.VALID);

        userRepository.save(user);
        storeRepository.save(store);
        menuRepository.saveAndFlush(menu);
        
        reservationService.createNewReservation(user, store.getId());
        cartService.createCart(user, menu.getId(), 10);

        PaymentRequest paymentRequest = new PaymentRequest("1", 10000);
        orderService.processPayment(user, paymentRequest);

        assertThat(cartService.findMyCarts(user.getId())).isEmpty();
    }

    @Test
    @DisplayName("개인 주문 결제 시 결제 요청 금액과 장바구니 금액이 일치하지 않으면 예외가 발생한다.")
    void isNotSame_paymentRequestAmount_and_cartAmount_then_exception() {
        User user = new User("userA", "pw", "email", "phone");
        Store store = new Store("storeA", "addr");
        Menu menu = new Menu(null, store, "menuA", 1000, null, MenuStatus.VALID);

        userRepository.save(user);
        storeRepository.save(store);
        menuRepository.save(menu);

        reservationService.createNewReservation(user, store.getId());
        cartService.createCart(user, menu.getId(), 10);

        PaymentRequest paymentRequest = new PaymentRequest("1", 5000);

        assertThatThrownBy(() -> orderService.processPayment(user, paymentRequest))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining(ExceptionCode.INVALID_PAY_AMOUNT.getMessage());
    }


}
