package edu.skku.grabtable.reservation.domain.response;

import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.domain.response.SharedOrderResponse;
import edu.skku.grabtable.reservation.domain.Reservation;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ReservationDetailResponse {

    private Long id;
    private UserCartsInfoResponse host;
    private List<UserCartsInfoResponse> invitees;
    private String inviteCode;
    private SharedOrderResponse sharedOrder;
    private List<OrderResponse> orders;

    public static ReservationDetailResponse of(Reservation reservation, List<OrderResponse> orders) {
        return new ReservationDetailResponse(
                //TODO
                reservation.getId(),
                UserCartsInfoResponse.of(reservation.getHost()),
                reservation.getInvitees().stream().map(UserCartsInfoResponse::of).toList(),
                reservation.getInviteCode(),
                null,
                orders
        );
    }
}
