package edu.skku.grabtable.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Review {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne
    private Store store;

    @ManyToOne
    private User user;

    private ReviewPlatform reviewPlatform;

    private String message;

    private Double rating;
}
