package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Long> {
}
