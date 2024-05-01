package edu.skku.grabtable.user.repository;

import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.user.domain.User;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface UserRepository extends JpaRepository<User, Long> {
    public Optional<User> findBySocialLoginId(String socialLoginId);

    public List<User> findByInvitedReservation(Reservation reservation);


    @Query("""
            SELECT u
            FROM User u
            join fetch u.invitedReservation r
            join fetch u.carts c
            where u.invitedReservation = :reservation
            """)
    List<User> findAllByInvitedReservation(Reservation reservation);
}
