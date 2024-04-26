package edu.skku.grabtable.reservation.domain.response;

import edu.skku.grabtable.reservation.domain.Reservation;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ReservationDetailResponse {

    private Long id;
    private UserInfoResponse host;
    private List<UserInfoResponse> invitees;
    private String inviteCode;
    private SharedOrderResponse sharedOrder;
    private List<OrderResponse> orders;

    public static ReservationDetailResponse of(Reservation reservation) {
        return new ReservationDetailResponse(
                reservation.getId(),
                null,
                null,
                reservation.getInviteCode(),
                null,
                null
        );
    }
}
