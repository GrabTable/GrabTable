package edu.skku.grabtable.reservation.service;

import edu.skku.grabtable.reservation.domain.ReservationHistory;
import edu.skku.grabtable.reservation.domain.event.ReservationFinishEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

@Component
@RequiredArgsConstructor
@Slf4j
public class ReservationEventHandler {

    private final RedisTemplate<String, Object> redisTemplate;
    private final KafkaTemplate<String, Object> kafkaTemplate;

    @Value("${topic.name}")
    private String topicName;

    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    void sendReservationHistory(ReservationHistory reservationHistory) {
        log.info("카프카 메시지 전송: {}", reservationHistory);
        kafkaTemplate.send(topicName, reservationHistory);
    }

    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    void handleFinishEvent(ReservationFinishEvent event) {
        redisTemplate.convertAndSend(getChannelName(event.getReservationId()), event);
    }

    private String getChannelName(Long reservationId) {
        return "Reservation-" + reservationId;
    }


}
