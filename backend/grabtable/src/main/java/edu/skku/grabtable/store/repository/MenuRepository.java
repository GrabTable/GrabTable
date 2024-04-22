package edu.skku.grabtable.store.repository;

import edu.skku.grabtable.store.domain.Menu;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Long> {

    List<Menu> findByStoreId(Long storeId);
}
