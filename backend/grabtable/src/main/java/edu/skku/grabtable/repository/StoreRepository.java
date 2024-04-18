package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.Store;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StoreRepository extends JpaRepository<Store, Long> {

    Optional<Store> findByStoreName(String storeName);
}
