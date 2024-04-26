package edu.skku.grabtable.reservation.repository;

import edu.skku.grabtable.reservation.domain.Reservation;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    List<Reservation> findByHostId(Long hostId);

    Optional<Reservation> findByInviteCode(String inviteCode);
}
