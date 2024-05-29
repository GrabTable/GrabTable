package edu.skku.grabtable.order.domain;

import com.siot.IamportRestClient.response.Payment;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.math.BigDecimal;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@NoArgsConstructor
@ToString
public class PayOneBill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String impUid;

    private String merchantUid;

    private String receiptUrl;

    private BigDecimal amount;


    public PayOneBill(Payment payment) {
        this.impUid = payment.getImpUid();
        this.merchantUid = payment.getMerchantUid();
        this.receiptUrl = payment.getReceiptUrl();
        this.amount = payment.getAmount();
    }
}
