package edu.skku.grabtable.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;

@Entity
@Getter
public class Reservation extends BaseTimeEntity{
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Integer numberOfUser;

    @Enumerated(EnumType.STRING)
    private ReservationStatus status;
}
