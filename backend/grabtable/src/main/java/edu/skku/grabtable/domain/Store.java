package edu.skku.grabtable.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.List;
import lombok.Getter;

@Entity
@Getter
public class Store extends BaseTimeEntity {

    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String storeName;

    private String address;

    private String storePictureUrl;

    private String phone;

    private String description;

    @Enumerated(EnumType.STRING)
    private StoreStatus status;

    @Enumerated(EnumType.STRING)
    private StoreCategory category;


}
