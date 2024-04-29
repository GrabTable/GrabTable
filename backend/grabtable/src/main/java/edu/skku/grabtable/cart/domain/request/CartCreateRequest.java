package edu.skku.grabtable.cart.domain.request;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CartCreateRequest {
    Long menuId;
    Integer quantity;
}
