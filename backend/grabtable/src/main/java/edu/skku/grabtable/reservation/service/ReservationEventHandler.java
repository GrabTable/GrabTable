package edu.skku.grabtable.reservation.service;

import edu.skku.grabtable.reservation.domain.event.ReservationFinishEvent;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

@Component
@RequiredArgsConstructor
public class ReservationEventHandler {

    private final RedisTemplate<String, Object> redisTemplate;

    @TransactionalEventListener(phase = TransactionPhase.BEFORE_COMMIT)
    void handleFinishEvent(ReservationFinishEvent event) {
        redisTemplate.convertAndSend(getChannelName(event.getReservationId()), event);
    }

    private String getChannelName(Long reservationId) {
        return "Reservation-" + reservationId;
    }


}
