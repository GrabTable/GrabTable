package edu.skku.grabtable.order.domain.request;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PrePaymentRequest {

    @NotEmpty
    private Long reservationId;

    @NotEmpty
    private Long cartId;

    @NotEmpty
    private Integer amount;
}
