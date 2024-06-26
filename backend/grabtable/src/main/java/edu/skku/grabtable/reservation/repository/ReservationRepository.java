package edu.skku.grabtable.reservation.repository;

import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.user.domain.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    @Query("""
            SELECT COUNT(r) > 0
            FROM Reservation r
            where r.host.id = :hostId
            and r.status = 'ONGOING'
            """)
    boolean existsByHostId(Long hostId);

    @Query("""
            SELECT r
            FROM Reservation r
            where r.host = :user
            or :user MEMBER OF r.invitees
            """)
    Optional<Reservation> findByUser(User user);

    Optional<Reservation> findByHostId(Long userId);

    Optional<Reservation> findByInviteCode(String inviteCode);
}
