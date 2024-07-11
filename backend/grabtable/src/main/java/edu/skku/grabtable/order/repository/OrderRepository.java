package edu.skku.grabtable.order.repository;

import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.user.domain.User;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("""
            SELECT o
            FROM Order o
            JOIN FETCH o.user u
            JOIN FETCH o.carts c
            WHERE  o.reservation = :reservation
            """)
    List<Order> findByReservation(Reservation reservation);

    Optional<Order> findByReservationAndUser(Reservation reservation, User user);
}
