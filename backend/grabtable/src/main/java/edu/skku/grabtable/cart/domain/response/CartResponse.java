package edu.skku.grabtable.cart.domain.response;

import edu.skku.grabtable.cart.domain.Cart;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class CartResponse {
    private String menuName;
    private Integer quantity;
    private Integer price;
    private Integer totalPrice;

    public static CartResponse of(Cart cart) {
        return new CartResponse(
                cart.getMenuName(),
                cart.getQuantity(),
                cart.getPrice(),
                cart.calculateTotalPrice()
        );
    }
}
