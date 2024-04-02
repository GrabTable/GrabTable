package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Long, Reservation> {
}
