package edu.skku.grabtable.outbox.service;

import edu.skku.grabtable.common.annotation.DistributedLock;
import edu.skku.grabtable.outbox.domain.MessagePublishResult;
import edu.skku.grabtable.outbox.domain.OutboxMessage;
import edu.skku.grabtable.outbox.repository.OutboxMessageRepository;
import edu.skku.grabtable.outbox.repository.ProcessedMessageCustomRepositoryImpl;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
@EnableScheduling
@Slf4j
public class OutboxMessageScheduler {

    private final OutboxMessageRepository outboxMessageRepository;
    private final KafkaTemplate<String, Object> kafkaTemplate;
    private final ProcessedMessageCustomRepositoryImpl processedMessageCustomRepository;
    private static final int BATCH_SIZE = 1000;

    @Value("${topic.name}")
    private String topicName;


    @DistributedLock(key = "OutboxMessageService.relayMessages")
    @Scheduled(cron = "0/10 * * * * *")
    public void relayMessages() {
        Page<OutboxMessage> messages = outboxMessageRepository.findMessagesToPublish(
                Pageable.ofSize(BATCH_SIZE));

        log.info("foundMessage nums = {}", messages.getNumber());

        if (messages.isEmpty()) {
            return;
        }

        MessagePublishResult result = publishMessages(messages);
        Set<Long> successMessageIds = result.getSuccessMessageIds();
        processedMessageCustomRepository.batchInsert(BATCH_SIZE, successMessageIds);

        //재시도 로직 TODO
    }

    private MessagePublishResult publishMessages(Page<OutboxMessage> messages) {
        Set<Long> successMessageIds = new HashSet<>();
        Set<Long> failMessageIds = new HashSet<>();

        for (OutboxMessage msg : messages) {
            CompletableFuture<SendResult<String, Object>> send = kafkaTemplate.send(topicName, msg.getPayload());

            send.whenComplete((result, ex) -> {
                if (ex != null) {
                    successMessageIds.add(msg.getId());
                } else {
                    failMessageIds.add(msg.getId());
                }
            });
        }
        return new MessagePublishResult(successMessageIds, failMessageIds);
    }


}
