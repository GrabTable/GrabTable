package edu.skku.grabtable.order.domain;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.reservation.domain.Reservation;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import java.util.ArrayList;
import java.util.List;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SharedOrder extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(mappedBy = "sharedOrder")
    private Reservation reservation;

    @OneToMany(mappedBy = "sharedOrder")
    List<Cart> carts = new ArrayList<>();

    @OneToMany(mappedBy = "sharedOrder")
    List<Order> orders = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private OrderStatus orderStatus;

    public static SharedOrder of(Reservation reservation) {
        SharedOrder sharedOrder = new SharedOrder();
        sharedOrder.reservation = reservation;
        sharedOrder.orderStatus = OrderStatus.PENDING;
        return sharedOrder;
    }
    }
}
