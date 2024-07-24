package edu.skku.grabtable.reservation.domain.event;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ReservationFinishEvent {
    private Long reservationId;
}
