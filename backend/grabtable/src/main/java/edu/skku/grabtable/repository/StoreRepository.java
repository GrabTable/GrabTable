package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StoreRepository extends JpaRepository<Long, Store> {
}
