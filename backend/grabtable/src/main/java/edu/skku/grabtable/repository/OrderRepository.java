package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Long, Order> {
}
