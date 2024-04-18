package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, Long> {
    public Optional<User> findBySocialLoginId(String socialLoginId);
}
