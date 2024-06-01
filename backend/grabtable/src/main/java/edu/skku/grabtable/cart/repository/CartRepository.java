package edu.skku.grabtable.cart.repository;

import edu.skku.grabtable.cart.domain.Cart;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CartRepository extends JpaRepository<Cart, Long> {
    List<Cart> findByUserId(Long userId);

    List<Cart> findBySharedOrderId(Long sharedOrderId);

    boolean existsByUserIdAndMenuName(Long userId, String menuName);

    boolean existsBySharedOrderIdAndMenuName(Long sharedOrderId, String menuName);

    @Query("""
            SELECT c
            from Cart c
            join fetch c.user u
            join fetch Reservation r on r.host = u
            where r.id = :reservationId
            """)
    List<Cart> findHostCurrentCartsByReservationId(Long reservationId);


}