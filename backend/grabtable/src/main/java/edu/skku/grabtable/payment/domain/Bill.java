package edu.skku.grabtable.payment.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.math.BigDecimal;

@Entity
@Getter
@NoArgsConstructor
@ToString
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String impUid;

    private String merchantUid;

    private String receiptUrl;

    private BigDecimal amount;

    @Builder
    public Bill(String impUid, String merchantUid, String receiptUrl, BigDecimal amount) {
        this.impUid = impUid;
        this.merchantUid = merchantUid;
        this.receiptUrl = receiptUrl;
        this.amount = amount;
    }
}
