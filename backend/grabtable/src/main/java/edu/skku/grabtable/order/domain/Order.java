package edu.skku.grabtable.order.domain;


import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.reservation.domain.Reservation;
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
import jakarta.persistence.Table;
import java.util.ArrayList;
import java.util.List;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "ORDERS")
@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Order extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shared_order_id")
    private SharedOrder sharedOrder;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Cart> carts = new ArrayList<>();

    private String paymentMethod;

    private Integer totalPrice;

    private String request;

    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    public Order(User user, Reservation reservation, List<Cart> carts) {
        this.reservation = reservation;
        this.user = user;
        this.carts = carts;
        changeCartsMapping(carts);
        this.totalPrice = calculateTotalPrice(carts);
        this.status = OrderStatus.PAID;
    }

    public Order(SharedOrder sharedOrder, User user, int amount) {
        this.sharedOrder = sharedOrder;
        this.user = user;
        changeCartsMapping(carts);
        this.totalPrice = amount;
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

    public void finishOrder() {
        this.status = OrderStatus.PAID;
    }
}
