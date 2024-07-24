package edu.skku.grabtable.sse.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Optional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@SpringBootTest
@Transactional
class SseEmitterInMemoryRepositoryTest {

    @Autowired
    SseEmitterInMemoryRepository sseEmitterInMemoryRepository;

    @Test
    @DisplayName("SSE emitter를 메모리 상에 저장할 수 있다.")
    void save() {
        //given
        long userId = 1L;

        //when
        sseEmitterInMemoryRepository.save(userId);
        Optional<SseEmitter> emitter = sseEmitterInMemoryRepository.findById(userId);

        //then
        assertThat(emitter.isPresent()).isTrue();

    }

    @Test
    @DisplayName("저장한 SSE Emitter 삭제 시 다시 조회되지 않는다.")
    void delete() {
        //given
        long userId = 1L;
        sseEmitterInMemoryRepository.save(userId);

        //when
        sseEmitterInMemoryRepository.deleteById(userId);

        //then
        Optional<SseEmitter> emitter = sseEmitterInMemoryRepository.findById(userId);
        assertThat(emitter.isEmpty()).isTrue();
    }
}