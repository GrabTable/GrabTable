package edu.skku.grabtable.integration;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class OrderCartIntegrationTest {

    @Test
    @DisplayName("사용자가 주문을 생성한 직후 user.getCart()는 빈 리스트이다.")
    void verifyDisconnectionBetweenUserAndCarts() {
        //OrderService.create()의 로직을 그대로 옮겨적고
        //PaymentValidator를 제외시킨다 (외부 종속성 테스트 불가)
    }
}
