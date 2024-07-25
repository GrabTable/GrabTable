package edu.skku.grabtable.order.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.order.domain.OrderStatus;
import edu.skku.grabtable.order.domain.request.PostPaymentRequest;
import edu.skku.grabtable.order.domain.request.PrePaymentRequest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.service.SharedOrderService;
import edu.skku.grabtable.user.domain.User;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/v1/shared-orders")
@RestController
@RequiredArgsConstructor
public class SharedOrderController {
    private final SharedOrderService sharedOrderService;

    @PostMapping("prepayment")
    public ResponseEntity<OrderResponse> preProcessPayment(
            @AuthUser User user,
            @Valid @RequestBody PrePaymentRequest prePaymentRequest
    ) {
        OrderResponse orderResponse = sharedOrderService.prePayment(user, prePaymentRequest);
        return ResponseEntity.status(HttpStatus.CREATED).body(orderResponse);
    }

    //TODO: orderId 관련 논의필요
    @PostMapping("postpayment")
    public ResponseEntity<Void> postProcessPayment(
            @RequestParam("success") OrderStatus success,
            @AuthUser User user,
            @Valid @RequestBody PostPaymentRequest postPaymentRequest
    ) {
        sharedOrderService.postPayment(success, user, postPaymentRequest);
        return ResponseEntity.status(HttpStatus.ACCEPTED).build();
    }

}
