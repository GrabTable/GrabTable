package edu.skku.grabtable.cart.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.cart.domain.request.CartCreateRequest;
import edu.skku.grabtable.cart.domain.request.CartUpdateRequest;
import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.user.domain.User;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RequestMapping("/v1/carts")
@RestController
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping("/me")
    public List<CartResponse> getMyCarts(@AuthUser User user) {
        return cartService.findMyCarts(user.getId());
    }

    @PostMapping
    public ResponseEntity<Void> addCart(
            @AuthUser User user,
            @RequestBody CartCreateRequest cartRequest
    ) {
        cartService.createCart(user, cartRequest.getMenuId(), cartRequest.getQuantity());
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @PatchMapping("/{cartId}")
    public ResponseEntity<Void> updateCart(
            @AuthUser User user,
            @PathVariable Long cartId,
            @RequestBody CartUpdateRequest cartRequest
    ) {
        cartService.updateCart(user, cartId, cartRequest);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{cartId}")
    public ResponseEntity<Void> deleteCart(@AuthUser User user, @PathVariable Long cartId) {
        cartService.deleteCart(user, cartId);
        return ResponseEntity.noContent().build();
    }

    /* === 공유 주문 기능 === */
    @PostMapping("/shared")
    public ResponseEntity<Void> addCartInSharedOrder(
            @AuthUser User user,
            @RequestBody CartCreateRequest cartRequest
    ) {
        cartService.createCartInSharedOrder(user, cartRequest.getMenuId(), cartRequest.getQuantity());
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @PatchMapping("/shared/{cartId}")
    public ResponseEntity<Void> updateCartInSharedOrder(
            @AuthUser User user,
            @PathVariable Long cartId,
            @RequestBody CartUpdateRequest cartRequest
    ) {
        cartService.updateCartInSharedOrder(user, cartId, cartRequest);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/shared/{cartId}")
    public ResponseEntity<Void> deleteCartInSharedOrder(@AuthUser User user, @PathVariable Long cartId) {
        cartService.deleteCartInSharedOrder(user, cartId);
        return ResponseEntity.noContent().build();
    }
}
