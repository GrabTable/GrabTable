package edu.skku.grabtable.outbox.repository;

import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@RequiredArgsConstructor
public class ProcessedMessageCustomRepositoryImpl {
    private final JdbcTemplate jdbcTemplate;

    String sql = "INSERT INTO processed_message(id) VALUES (?)";

    @Transactional
    public void batchInsert(int batchSize, Set<Long> ids) {
        jdbcTemplate.batchUpdate(sql,
                ids,
                ids.size(),
                (ps, id) -> {
                    ps.setLong(1, id);
                });
    }
}
