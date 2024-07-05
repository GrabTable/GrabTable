package edu.skku.grabtable.common.inspector;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.hibernate.resource.jdbc.spi.StatementInspector;
import org.springframework.stereotype.Component;

@Component
public class QueryCountInspector implements StatementInspector {

    private final ThreadLocal<QueryCounter> queryCounter = new ThreadLocal<>();

    @Override
    public String inspect(String sql) {
        QueryCounter counter = queryCounter.get();
        if (counter != null) {
            counter.increaseCount();
        }
        return sql;
    }

    public void startCounter() {
        queryCounter.set(new QueryCounter(0L, System.currentTimeMillis()));
    }

    public void clearCounter() {
        queryCounter.remove();
    }

    public Long getCount() {
        return queryCounter.get().getCount();
    }

    public Long getTimeStamp() {
        return queryCounter.get().getTimestamp();
    }

    @Getter
    @AllArgsConstructor
    static class QueryCounter {

        private Long count;
        private Long timestamp;

        public void increaseCount() {
            count++;
        }
    }
}
