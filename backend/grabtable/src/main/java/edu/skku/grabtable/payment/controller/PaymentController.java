package edu.skku.grabtable.payment.controller;

import com.siot.IamportRestClient.exception.IamportResponseException;
import edu.skku.grabtable.payment.domain.Bill;
import edu.skku.grabtable.payment.domain.request.PaymentRequestDto;
import edu.skku.grabtable.payment.domain.response.BillResponse;
import edu.skku.grabtable.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RequestMapping("/v1/payment")
@RequiredArgsConstructor
@RestController
public class PaymentController {

    private final PaymentService paymentService;

    @PostMapping(value = "/verify")
    public BillResponse paymentByImpUid(@RequestBody PaymentRequestDto paymentDto) throws IamportResponseException, IOException {
        Bill bill = paymentService.verify(paymentDto);
        return BillResponse.of(bill);
    }
}
