package edu.skku.grabtable.order.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
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
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/v1/shared-orders")
@RestController
@RequiredArgsConstructor
public class SharedOrderController {
    private final SharedOrderService sharedOrderService;

    @PostMapping
    public ResponseEntity<OrderResponse> processPayment(
            @AuthUser User user,
            @Valid @RequestBody PaymentRequest paymentRequest
    ) {
        OrderResponse orderResponse = sharedOrderService.processPayment(user, paymentRequest);
        return ResponseEntity.status(HttpStatus.CREATED).body(orderResponse);
    }
}
