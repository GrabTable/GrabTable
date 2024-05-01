package edu.skku.grabtable.cart.domain;

import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.user.domain.User;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Cart extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User user;

    private String menuName;

    private Integer price;

    @ManyToOne
    private Order order;

    @ManyToOne
    private SharedOrder sharedOrder;

    private Integer quantity;

    public Cart(User user, Menu menu, Integer quantity) {
        this.user = user;
        this.menuName = menu.getMenuName();
        this.price = menu.getPrice();
        this.quantity = quantity;
    }

    public void changeQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public int calculateTotalPrice() {
        return this.price * this.quantity;
    }

    public void disconnectUser() {
        this.user = null;
    }

    public void connectOrder(Order order) {
        this.order = order;
    }
}
