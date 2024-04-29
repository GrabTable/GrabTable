package edu.skku.grabtable.cart.repository;

import edu.skku.grabtable.cart.domain.Cart;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Long> {
    List<Cart> findByUserId(Long userId);

    boolean existsByUserIdAndMenuName(Long userId, String menuName);


}