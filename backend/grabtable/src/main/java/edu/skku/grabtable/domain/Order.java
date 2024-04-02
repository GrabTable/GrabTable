package edu.skku.grabtable.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "ORDERS")
public class Order {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne
    private Reservation reservation;

    private String paymentMethod;

    private Integer totalPrice;

    private String request;

    private OrderStatus status;

    private OrderType type;

}
