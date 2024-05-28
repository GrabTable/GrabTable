package edu.skku.grabtable.order.infrastructure;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.PayOneBill;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.repository.BillRepository;
import java.io.IOException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class PaymentValidator {

    private final IamportClient iamportClient;
    private final BillRepository billRepository;

    public void verify(PaymentRequest paymentRequest) {

        Payment receivedcPayment = null;
        try {
            receivedcPayment = iamportClient.paymentByImpUid(paymentRequest.getImpUid()).getResponse();
        } catch (IamportResponseException | IOException e) {
            throw new BadRequestException(ExceptionCode.FAILED_TO_VALIDATE_PAYMENT);
        }

        if (!receivedcPayment.getImpUid().equals(paymentRequest.getImpUid())) {
            throw new BadRequestException(ExceptionCode.FAILED_TO_VALIDATE_PAYMENT);
        }
        //TODO: 서버-사이드 이벤트
        //주문결제 정보 DB에 저장
        PayOneBill payOneBill = new PayOneBill(receivedcPayment.getImpUid(), receivedcPayment.getMerchantUid(),
                receivedcPayment.getReceiptUrl(), receivedcPayment.getAmount());
        billRepository.save(payOneBill);
    }
}
