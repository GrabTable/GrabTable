package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Long> {
}