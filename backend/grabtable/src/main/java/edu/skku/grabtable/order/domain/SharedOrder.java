package edu.skku.grabtable.order.domain;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.user.domain.User;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
import org.hibernate.annotations.SQLDelete;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@SQLDelete(sql = "UPDATE shared_order SET order_status = 'CANCELED' where id = ?")
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

    public Order addOrder(User user, int amount) {
        Order order = new Order(this, user, amount);
        this.orders.add(order);
        return order;
    }

    public Order addPreOrder(User user, int amount) {
        Order order = new Order(this, user, amount, OrderStatus.PENDING);
        this.orders.add(order);
        return order;
    }

    public int calculateTotalAmount() {
        return this.carts.stream()
                .mapToInt(Cart::calculateTotalPrice)
                .sum();
    }

    public int calculateLeftAmount() {
        return calculateTotalAmount() - getTotalPaidAmount();
    }

    private int getTotalPaidAmount() {
        return this.orders.stream().mapToInt(Order::getTotalPrice).sum();
    }

    public void complete() {
        this.orderStatus = OrderStatus.PAID;
    }
}
