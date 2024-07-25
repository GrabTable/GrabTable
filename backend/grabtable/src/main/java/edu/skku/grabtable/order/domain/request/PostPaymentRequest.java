package edu.skku.grabtable.order.domain.request;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PostPaymentRequest extends PaymentRequest {

    @NotBlank
    private Long orderId;

    public PostPaymentRequest(String number, int i, long l) {
        super(number, i);
        this.orderId = l;
    }
}
