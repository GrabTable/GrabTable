package edu.skku.grabtable.user.repository;

import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.user.domain.User;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, Long> {
    public Optional<User> findBySocialLoginId(String socialLoginId);

    public List<User> findByInvitedReservation(Reservation reservation);
}
