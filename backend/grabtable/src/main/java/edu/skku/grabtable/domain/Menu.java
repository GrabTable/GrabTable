package edu.skku.grabtable.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Menu {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne
    private Store store;

    private String menuName;

    private Integer price;

    private String menuPictureUrl;

    private MenuStatus status;
}
