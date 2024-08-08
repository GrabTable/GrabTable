package edu.skku.grabtable.reservation.domain;

import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.user.domain.User;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import java.util.ArrayList;
import java.util.List;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ReservationHistory extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "host_id")
    private User host;

    @OneToMany(mappedBy = "reservationHistory", cascade = CascadeType.PERSIST)
    private List<InvitedReservationHistory> invitedReservationHistories = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shared_order_id")
    private SharedOrder sharedOrder;

    public static ReservationHistory of(
            Reservation reservation,
            List<InvitedReservationHistory> invitedReservationHistories
    ) {
        ReservationHistory reservationHistory = new ReservationHistory();
        reservationHistory.host = reservation.getHost();
        reservationHistory.store = reservation.getStore();
        reservationHistory.sharedOrder = reservation.getSharedOrder();
        for (InvitedReservationHistory invitedReservationHistory : invitedReservationHistories) {
            reservationHistory.addInvitedReservationHistory(invitedReservationHistory);
        }

        return reservationHistory;
    }

    private void addInvitedReservationHistory(InvitedReservationHistory invitedReservationHistory) {
        invitedReservationHistories.add(invitedReservationHistory);
        invitedReservationHistory.addReservationHistory(this);
    }
}
