package edu.skku.grabtable.cart.domain;

import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.user.domain.User;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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

    @ManyToOne(fetch = FetchType.LAZY)
    private User user;

    private String menuName;

    private Integer unitPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    private Order order;

    @ManyToOne(fetch = FetchType.LAZY)
    private SharedOrder sharedOrder;

    private Integer quantity;

    public Cart(User user, Menu menu, Integer quantity) {
        this.user = user;
        this.menuName = menu.getMenuName();
        this.unitPrice = menu.getPrice();
        this.quantity = quantity;
    }

    public Cart(SharedOrder sharedOrder, Menu menu, Integer quantity) {
        this.sharedOrder = sharedOrder;
        this.menuName = menu.getMenuName();
        this.unitPrice = menu.getPrice();
        this.quantity = quantity;
    }

    public void changeQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public int calculateTotalPrice() {
        return this.unitPrice * this.quantity;
    }

    public void disconnectUser() {
        this.user = null;
    }

    public void connectOrder(Order order) {
        this.order = order;
    }
}
