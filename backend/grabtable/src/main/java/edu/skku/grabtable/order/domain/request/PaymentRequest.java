package edu.skku.grabtable.order.domain.request;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PaymentRequest {

    @NotEmpty
    private String impUid;

    @NotNull
    private Integer amount;
}
