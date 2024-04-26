package edu.skku.grabtable.cart.repository;

import edu.skku.grabtable.cart.domain.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Long> {
}