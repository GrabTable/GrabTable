package edu.skku.grabtable.payment.domain.request;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.math.BigDecimal;

@Getter
@AllArgsConstructor
public class PaymentRequestDto {

//    @NotEmpty
    private String impUid;

//    @NotEmpty
    private BigDecimal amount;
}
