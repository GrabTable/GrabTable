package edu.skku.grabtable.outbox.repository;

import edu.skku.grabtable.outbox.domain.OutboxMessage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OutboxMessageRepository extends JpaRepository<OutboxMessage, Long> {


    @Query("""
            SELECT m
            FROM OutboxMessage m
            LEFT JOIN ProcessedMessage pm
            ON pm.id = m.id
            WHERE pm.id IS NULL
            ORDER BY m.id ASC
            """)
    Page<OutboxMessage> findMessagesToPublish(Pageable pageable);


}
