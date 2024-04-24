package edu.skku.grabtable.payment.domain.request;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class PaymentDto {

    @NotEmpty
    private final String impUid;

    @NotEmpty
    private final Long amount;
}
