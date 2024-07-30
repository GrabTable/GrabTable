package edu.skku.grabtable.reservation.repository;

import edu.skku.grabtable.reservation.domain.ReservationHistory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationHistoryRepository extends JpaRepository<ReservationHistory, Long> {
}
