package edu.skku.grabtable.auth.repository;

import edu.skku.grabtable.auth.domain.AuthProvider;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AuthProviderRepository extends JpaRepository<AuthProvider, Long> {

    Optional<AuthProvider> findBySocialLoginId(String socialLoginId);
}
