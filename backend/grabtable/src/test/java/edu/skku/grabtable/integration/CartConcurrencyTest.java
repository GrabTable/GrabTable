package edu.skku.grabtable.integration;

import static org.assertj.core.api.Assertions.assertThat;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartUpdateRequest;
import edu.skku.grabtable.cart.facade.NamedLockCartFacade;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.domain.StoreCategory;
import edu.skku.grabtable.store.domain.StoreStatus;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import jakarta.persistence.EntityManager;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
//@DataJpaTest
public class CartConcurrencyTest {
    @Autowired
    private NamedLockCartFacade namedLockCartFacade;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    StoreRepository storeRepository;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    CartService cartService;

    @Autowired
    EntityManager entityManager;

    //
    @BeforeEach
    @Transactional
    public void before() {
        User user = new User(1L, "kakaoUser", "url", "userA", "1234", "email", "phone", null, new ArrayList<>(),
                new ArrayList<>());
        userRepository.saveAndFlush(user);
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>(), new ArrayList<>());
        storeRepository.saveAndFlush(store);
        Reservation reservation = new Reservation(user, store);
        SharedOrder sharedOrder = reservation.getSharedOrder();
        Cart cart = new Cart(1L, user, "coke", 2000, null, sharedOrder, 1);
        sharedOrder.getCarts().add(cart);
        reservationRepository.saveAndFlush(reservation);
        cartRepository.saveAndFlush(cart);
    }

    @Test
    @DisplayName("동시에 100개의 요청으로 장바구니 재고 업데이트")
    void update_100_request() throws InterruptedException {
        // given
        final int threadCount = 100;
        final ExecutorService executorService = Executors.newFixedThreadPool(32);
        final CountDownLatch countDownLatch = new CountDownLatch(threadCount);
        CartUpdateRequest cartUpdateRequest = new CartUpdateRequest(1);
        // when
        Cart cart = cartRepository.findById(1L).orElseThrow();
        for (int i = 0; i < threadCount; i++) {
            int finalI = i;
            executorService.submit(() -> {
                try {
                    namedLockCartFacade.update(1L, cart.getUser(), new CartUpdateRequest(finalI));
                } finally {
                    countDownLatch.countDown();
                }
            });
        }
        countDownLatch.await();
        final Cart cartResult = cartRepository.findById(1L).orElseThrow();
        // then
        assertThat(cartResult.getQuantity()).isEqualTo(99);
    }

    @Test
    @DisplayName("동시에 100개 장바구니 업데이트 실패")
    void update_100_request_fail() throws InterruptedException {
        // given
        final int threadCount = 100;
        final ExecutorService executorService = Executors.newFixedThreadPool(32);
        final CountDownLatch countDownLatch = new CountDownLatch(threadCount);
        CartUpdateRequest cartUpdateRequest = new CartUpdateRequest(1);
        // when
        Cart cart = cartRepository.findById(1L).orElseThrow();
        for (int i = 0; i < threadCount; i++) {
            int finalI = i;
            executorService.submit(() -> {
                try {
                    cartService.updateCartInSharedOrder(cart.getUser(), 1L, new CartUpdateRequest(finalI));
                } finally {
                    countDownLatch.countDown();
                }
            });
        }
        countDownLatch.await();
        final Cart cartResult = cartRepository.findById(1L).orElseThrow();
        // then
        assertThat(cartResult.getQuantity()).isNotEqualTo(99);
    }
}
