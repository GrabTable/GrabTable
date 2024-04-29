package edu.skku.grabtable.cart.domain.request;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class CartUpdateRequest {
    private Long cartId;
    private Integer quantity;
}
