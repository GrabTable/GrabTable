package edu.skku.grabtable.payment.domain.response;

import edu.skku.grabtable.payment.domain.Bill;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;

@AllArgsConstructor
@Getter
public class BillResponse {

    private Long id;

    private String impUid;

    private String merchantUid;

    private String receiptUrl;

    private BigDecimal amount;

    public static BillResponse of(Bill bill) {
        return new BillResponse(bill.getId(), bill.getImpUid(), bill.getMerchantUid(), bill.getReceiptUrl(), bill.getAmount());
    }
}
