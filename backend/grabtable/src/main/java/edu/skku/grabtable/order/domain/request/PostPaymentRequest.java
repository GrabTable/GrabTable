package edu.skku.grabtable.order.domain.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PostPaymentRequest {

    @NotBlank
    private Long orderId;

    @NotEmpty
    private String impUid;

    @NotNull
    private Integer amount;
}
