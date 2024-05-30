package edu.skku.grabtable.auth.repository;

import edu.skku.grabtable.auth.domain.RefreshToken;
import org.springframework.data.repository.CrudRepository;

public interface RefreshTokenRepository extends CrudRepository<RefreshToken, String> {
}
