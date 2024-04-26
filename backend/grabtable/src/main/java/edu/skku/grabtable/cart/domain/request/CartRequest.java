package edu.skku.grabtable.cart.domain.request;

import lombok.Getter;

@Getter
public class CartRequest {
    Long menuId;
    Long orderId;
    Integer quantity;

//    Long reservationId;
}
