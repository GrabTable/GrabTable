package edu.skku.grabtable.sse.repository;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Repository
@RequiredArgsConstructor
@Transactional
public class SseEmitterInMemoryRepository {

    private static final long timeout = 10L * 1000 * 60;
    private final Map<Long, SseEmitter> userEmitters = new ConcurrentHashMap<>();


    public void save(Long userId) {
        SseEmitter emitter = new SseEmitter(timeout);
        userEmitters.put(userId, emitter);
    }

    public SseEmitter findById(Long userId) {
        return userEmitters.getOrDefault(userId, null);
    }

    public void deleteById(Long userId) {
        userEmitters.remove(userId);
    }
}
