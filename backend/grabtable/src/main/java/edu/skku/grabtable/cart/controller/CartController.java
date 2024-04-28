package edu.skku.grabtable.cart.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartRequest;
import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.domain.User;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("v1/cart")
@RestController
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping("/me")
    List<Cart> getCart(@AuthUser User user) {
        return cartService.getCurrentCarts(user.getId());
    }

    @PostMapping()
    void addCart(@AuthUser User user, CartRequest cartRequest) {
        cartService.createCart(user.getId(), cartRequest);
    }

    @PatchMapping("/{cartId}")
    void modifyCart(@AuthUser User user, @PathVariable Long cartId, CartRequest cartRequest) {
        cartService.modifyCart(user.getId(), cartId, cartRequest);
    }

    @DeleteMapping("/{cartId}")
    void deleteCart(@AuthUser User user, @PathVariable Long cartId) {
        cartService.deleteCart(user.getId(), cartId);
    }
}
