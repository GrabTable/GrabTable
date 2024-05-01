package edu.skku.grabtable.cart.domain.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class CartUpdateRequest {
    private Integer quantity;
}
