package edu.skku.grabtable.payment.controller;

import com.siot.IamportRestClient.exception.IamportResponseException;
import edu.skku.grabtable.payment.domain.request.PaymentDto;
import edu.skku.grabtable.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
@RequestMapping("/v1/payment")
@RequiredArgsConstructor
@RestController
public class PaymentController {

    private final PaymentService paymentService;
    @PostMapping(value = "/verify")
    public ResponseEntity.BodyBuilder paymentByImpUid(@RequestBody PaymentDto paymentDto) throws IamportResponseException, IOException {
        paymentService.verify(paymentDto);
        return ResponseEntity.ok();
//        verified_data =  iamportClient.paymentByImpUid(imp_uid);
//        verified_data.getAmount() != paymentDto.amount
    }
}
