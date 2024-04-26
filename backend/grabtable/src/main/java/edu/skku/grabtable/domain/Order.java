package edu.skku.grabtable.domain;

import edu.skku.grabtable.cart.domain.Cart;
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

@Entity
@Table(name = "ORDERS")
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


    public Order(List<Cart> carts) {
        totalPrice = 0;
        for (Cart cart : carts) {
            cart.connectOrder(this);
            totalPrice += cart.getMenu().getPrice() * cart.getQuantity();
        }

    }
}
