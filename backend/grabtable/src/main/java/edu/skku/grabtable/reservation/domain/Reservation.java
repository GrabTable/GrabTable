package edu.skku.grabtable.reservation.domain;

import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.user.domain.User;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
import java.util.UUID;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class Reservation extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "host_id")
    private User host;

    @OneToMany(mappedBy = "invitedReservation")
    private List<User> invitees = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "shared_order_id")
    private SharedOrder sharedOrder;

    private String inviteCode;


    @Enumerated(EnumType.STRING)
    private ReservationStatus status;

    public Reservation(final User host, final Store store) {
        this.host = host;
        this.store = store;
        this.status = ReservationStatus.ONGOING;
        this.sharedOrder = SharedOrder.of(this);
        this.inviteCode = createInviteCode();
    }

    private String createInviteCode() {
        return UUID.randomUUID().toString();
    }
}
