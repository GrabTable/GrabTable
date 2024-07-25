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
            JOIN FETCH r.host h
            JOIN FETCH r.sharedOrder so
            LEFT JOIN FETCH so.carts c
            where (r.host = :user
            or :user MEMBER OF r.invitees)
            and r.status = 'ONGOING'
            """)
    Optional<Reservation> findOngoingReservationByUser(User user);

    @Query("""
                SELECT r
                FROM Reservation r
                WHERE (r.host.id = :userId
                OR :userId IN (SELECT i.id FROM r.invitees i))
                AND r.status = 'CONFIRMED'
                ORDER BY r.lastModifiedAt DESC
                LIMIT 1
            """)
    Optional<Reservation> findLastRecentlyConfirmedReservationByUserId(Long userId);

    Optional<Reservation> findByHostId(Long userId);

    Optional<Reservation> findByInviteCode(String inviteCode);
}
