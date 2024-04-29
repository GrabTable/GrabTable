package edu.skku.grabtable.order.repository;

import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.reservation.domain.Reservation;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByReservation(Reservation reservation);
}
