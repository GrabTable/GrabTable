package edu.skku.grabtable.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Cart {

    @Id @GeneratedValue
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
