package edu.skku.grabtable.reservation.domain;

import edu.skku.grabtable.domain.BaseTimeEntity;
import edu.skku.grabtable.domain.Order;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.store.domain.Store;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import java.util.UUID;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)

public class Reservation extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "host_id")
    private User host;

    @OneToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "shared_order_id")
    private Order sharedOrder;

    private String inviteCode;


    @Enumerated(EnumType.STRING)
    private ReservationStatus status;

    public Reservation(User host) {
        this.host = host;
        this.status = ReservationStatus.ONGOING;
        this.sharedOrder = new Order();
        this.inviteCode = createInviteCode();
    }

    private String createInviteCode() {
        return UUID.randomUUID().toString();
    }
}
