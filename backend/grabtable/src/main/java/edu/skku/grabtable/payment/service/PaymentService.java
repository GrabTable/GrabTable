package edu.skku.grabtable.payment.service;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.payment.domain.Bill;
import edu.skku.grabtable.payment.domain.request.PaymentRequestDto;
import edu.skku.grabtable.payment.repository.BillRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;

@Service
@RequiredArgsConstructor
@Transactional
public class PaymentService {
    @Value("${iamport.key}")
    private String restApiKey;

    @Value("${iamport.secret}")
    private String restApiSecret;

    private IamportClient iamportClient;
    private final BillRepository billRepository;
    @PostConstruct
    public void init(){
        this.iamportClient = new IamportClient(restApiKey, restApiSecret);
    }
    public Bill verify(PaymentRequestDto paymentDto) throws IamportResponseException, IOException {
        IamportResponse<Payment> paymentIamportResponse = iamportClient.paymentByImpUid(paymentDto.getImpUid());
        Payment receivedcPayment = paymentIamportResponse.getResponse();
        if (receivedcPayment.getImpUid().equals(paymentDto.getImpUid())) {
            //TODO: 서버-사이드 이벤트
            //주문결제 정보 DB에 저장
            Bill bill = new Bill(receivedcPayment.getImpUid(), receivedcPayment.getMerchantUid(), receivedcPayment.getReceiptUrl(), receivedcPayment.getAmount());
            billRepository.save(bill);
            return bill;
        }
        throw new BadRequestException(ExceptionCode.INVALID_REQUEST);

    }
}
