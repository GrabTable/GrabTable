package edu.skku.grabtable.order.domain.request;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PrePaymentRequest {

    @NotNull
    private Long reservationId;

    @NotNull
    private Long cartId;

    @Positive
    private Integer amount;
}
