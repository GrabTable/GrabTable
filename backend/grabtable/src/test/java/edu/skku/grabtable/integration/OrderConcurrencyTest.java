package edu.skku.grabtable.integration;

import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.order.service.OrderService;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.reservation.service.ReservationService;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.domain.MenuStatus;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class OrderConcurrencyTest {

    @Autowired
    private EntityManager em;

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ReservationRepository reservationRepository;

    @Autowired
    private StoreRepository storeRepository;

    @Autowired
    private MenuRepository menuRepository;

    @MockBean
    PaymentValidator paymentValidator;

    @AfterEach
    void tearDown() {
        //동시성 제어 시 테스트 스레드 이외의 스레드에서 로직을 실행함.
        //다른 스레드에서는 Rollback 적용이 안되므로, 직접 DB를 복구
        em.createQuery("delete from Cart c").executeUpdate();
        em.createQuery("delete from Order o").executeUpdate();
        em.createQuery("delete from Reservation r").executeUpdate();
        em.createQuery("delete from Menu m").executeUpdate();
        em.createQuery("delete from Store s").executeUpdate();
        em.createQuery("delete from User u").executeUpdate();
    }

    @Test
    @DisplayName("사용자가 결제를 여러 번 시도해도 주문은 한 번만 생성된다.")
    @Rollback(value = false)
        //TODO
    void verifySingleOrderCreation() throws InterruptedException, ExecutionException {
        //동시 주문 생성 요청
        int nThreads = 100;
        ExecutorService executorService = Executors.newFixedThreadPool(nThreads);
        CountDownLatch latch = new CountDownLatch(nThreads);

        final User findUser = executorService.submit(() -> {
            Store store = new Store("storeA", "addr");
            Menu menuA = new Menu(null, store, "menuA", 10000, null, MenuStatus.VALID);
            Menu menuB = new Menu(null, store, "menuB", 10000, null, MenuStatus.VALID);
            storeRepository.saveAndFlush(store);
            menuRepository.saveAndFlush(menuA);
            menuRepository.saveAndFlush(menuB);

            User user = new User("userA", "pw", "email", "phone");
            userRepository.saveAndFlush(user);

            //예약 생성
            reservationService.createNewReservation(user, store.getId());
            Reservation reservation = reservationRepository.findByUser(user).orElseThrow();

            //장바구니 추가 (총금액 10000원)
            cartService.createCart(user, menuA.getId(), 1);
            cartService.createCart(user, menuB.getId(), 1);
            return user;
        }).get();

        PaymentRequest paymentRequest = new PaymentRequest("1", 20000);

        for (int i = 0; i < nThreads; i++) {
            executorService.execute(() -> {
                try {
                    orderService.processPayment(findUser, paymentRequest);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    latch.countDown();
                }
            });
        }

        latch.await();

        List<Order> orders = em.createQuery("select o from Order o where o.user = :user", Order.class)
                .setParameter("user", findUser)
                .getResultList();

//        assertThat(orders.size()).isEqualTo(1);

    }
}
