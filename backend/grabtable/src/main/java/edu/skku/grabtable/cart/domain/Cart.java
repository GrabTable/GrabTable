package edu.skku.grabtable.cart.domain;

import edu.skku.grabtable.domain.*;
import jakarta.persistence.*;
import lombok.Getter;

@Entity
@Getter
public class Cart extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User user;

    @ManyToOne
    private Menu menu;

    @ManyToOne
    private Order order;

    @ManyToOne
    private Store store;

    private Integer quantity;
}
