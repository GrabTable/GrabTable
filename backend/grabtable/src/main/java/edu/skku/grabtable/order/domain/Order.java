package edu.skku.grabtable.order.domain;


import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.reservation.domain.Reservation;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.util.List;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "ORDERS")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Order extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;

    private String paymentMethod;

    private Integer totalPrice;

    private String request;

    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    @Enumerated(EnumType.STRING)
    private OrderType type;

    public Order(Reservation reservation, List<Cart> carts) {
        this.reservation = reservation;
        changeCartsMapping(carts);
        this.totalPrice = calculateTotalPrice(carts);
        this.status = OrderStatus.PENDING;
    }


    public Order(List<Cart> carts) {
        changeCartsMapping(carts);
        this.totalPrice = calculateTotalPrice(carts);
    }

    private void changeCartsMapping(List<Cart> carts) {
        for (Cart cart : carts) {
            cart.connectOrder(this);
            cart.disconnectUser();
        }
    }

    private int calculateTotalPrice(List<Cart> carts) {
        return carts.stream().mapToInt(Cart::calculateTotalPrice).sum();
    }
}
