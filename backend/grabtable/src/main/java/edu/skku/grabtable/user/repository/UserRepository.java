package edu.skku.grabtable.user.repository;

import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.user.domain.User;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


public interface UserRepository extends JpaRepository<User, Long> {
    public Optional<User> findBySocialLoginId(String socialLoginId);

    public List<User> findByInvitedReservation(Reservation reservation);


    @Query("""
            SELECT u
            FROM User u
            join fetch u.invitedReservation r
            left join fetch u.carts c
            where u.invitedReservation = :reservation and r.host != u
            """)
    List<User> findAllByInvitedReservation(Reservation reservation);
    
    @Modifying(clearAutomatically = true)
    @Query("update User u SET u.invitedReservation = null where u.invitedReservation = :reservation")
    void clearInvitedReservationByReservation(Reservation reservation);

}
