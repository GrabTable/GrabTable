package edu.skku.grabtable.reservation.domain.event;

import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ReservationUpdateEvent {
    private ReservationDetailResponse details;
}
