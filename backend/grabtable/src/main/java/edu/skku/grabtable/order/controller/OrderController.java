package edu.skku.grabtable.order.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.service.OrderService;
import edu.skku.grabtable.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @PostMapping
    public OrderResponse create(@AuthUser User user) {
        return orderService.create(user);
    }

}
