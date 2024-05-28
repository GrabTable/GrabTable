package edu.skku.grabtable.order.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.order.domain.request.PaymentRequest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.service.SharedOrderService;
import edu.skku.grabtable.user.domain.User;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
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
    public OrderResponse processPayment(
            @AuthUser User user,
            @Valid @RequestBody PaymentRequest paymentRequest
    ) {
        return sharedOrderService.processPayment(user, paymentRequest);
    }
}
