package edu.skku.grabtable.outbox.domain;

import edu.skku.grabtable.common.domain.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class OutboxMessage extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private OutboxMessageType type;

    @Column(name = "PAYLOAD", columnDefinition = "longtext")
    private String payload;

    public static OutboxMessage of(String payload) {
        OutboxMessage outboxMessage = new OutboxMessage();
        outboxMessage.type = OutboxMessageType.INIT;
        outboxMessage.payload = payload;
        return outboxMessage;
    }
}
