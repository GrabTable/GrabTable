package edu.skku.grabtable.order.repository;

import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.reservation.domain.Reservation;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SharedOrderRepository extends JpaRepository<SharedOrder, Long> {

    Optional<SharedOrder> findByReservation(Reservation reservation);
}
