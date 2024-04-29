package edu.skku.grabtable.integration;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class ReservationIntegrationTest {

    @Test
    @DisplayName("호스트가 예약을 취소하면 예약의 모든 참여자의 예약 상태가 취소된다.")
    void host_cancel_propagate() {
    }

    @Test
    @DisplayName("참여자가 예약을 취소하면 예약의 참여자가 1명 줄어든 상태로 유지된다.")
    void invitee_cancel_remain() {
    }

    @Test
    @DisplayName("모든 참여자가 주문 완료 상태라면 예약 확정에 성공한다.")
    void confirm_reservation() {
    }

    @Test
    @DisplayName("유저 ID로 예약 찾을 시 현재 예약 정보를 확인할 수 있다.")
    void findReservationDetailInfo() {
    }

}
