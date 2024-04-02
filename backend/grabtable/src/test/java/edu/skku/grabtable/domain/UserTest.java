package edu.skku.grabtable.domain;

import edu.skku.grabtable.config.JpaAuditingConfig;
import edu.skku.grabtable.repository.UserRepository;
import java.util.List;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;

@SpringBootTest
@Import(JpaAuditingConfig.class)
class UserTest {

    @Autowired
    UserRepository userRepository;

    @Test
    void insertUser() {
        User user = User.builder()
                .username("od")
                .password("1234")
                .email("sesdflk@gmail.com")
                .phone("01021213212")
                .build();
        userRepository.save(user);

        List<User> result = userRepository.findAll();
        Assertions.assertThat(result.size()).isEqualTo(1);
    }


}