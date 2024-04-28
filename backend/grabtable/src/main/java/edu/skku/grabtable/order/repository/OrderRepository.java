package edu.skku.grabtable.order.repository;

import edu.skku.grabtable.order.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
