package edu.skku.grabtable.reservation.repository;

import edu.skku.grabtable.reservation.domain.ReservationHistory;
import edu.skku.grabtable.user.domain.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationHistoryRepository extends JpaRepository<ReservationHistory, Long> {
    Optional<ReservationHistory> findByHost(User host);
}
