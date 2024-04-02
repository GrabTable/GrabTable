package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
