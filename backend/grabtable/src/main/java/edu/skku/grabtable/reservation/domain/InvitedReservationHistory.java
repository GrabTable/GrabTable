package edu.skku.grabtable.reservation.domain;

import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.user.domain.User;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class InvitedReservationHistory extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invitee_id")
    private User invitee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reservation_history_id")
    private ReservationHistory reservationHistory;

    public static InvitedReservationHistory from(User invitee) {
        InvitedReservationHistory invitedReservationHistory = new InvitedReservationHistory();
        invitedReservationHistory.invitee = invitee;

        return invitedReservationHistory;
    }

    public void addReservationHistory(ReservationHistory reservationHistory) {
        this.reservationHistory = reservationHistory;
    }
}
