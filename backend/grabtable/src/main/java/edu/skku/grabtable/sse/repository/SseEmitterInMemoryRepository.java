package edu.skku.grabtable.sse.repository;

import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Repository
public class SseEmitterInMemoryRepository {

    private static final long timeout = 10L * 1000 * 60;
    private final Map<Long, SseEmitter> userEmitters = new ConcurrentHashMap<>();


    public void save(Long userId) {
        SseEmitter emitter = new SseEmitter(timeout);
        userEmitters.put(userId, emitter);
    }

    public Optional<SseEmitter> findById(Long userId) {
        return Optional.ofNullable(userEmitters.get(userId));
    }

    public void deleteById(Long userId) {
        userEmitters.remove(userId);
    }
}
