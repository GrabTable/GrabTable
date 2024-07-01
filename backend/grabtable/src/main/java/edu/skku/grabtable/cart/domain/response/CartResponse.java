package edu.skku.grabtable.cart.domain.response;

import edu.skku.grabtable.cart.domain.Cart;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class CartResponse {
    private Long id;
    private String menuName;
    private Integer quantity;
    private Integer price;
    private Integer totalPrice;

    public static CartResponse of(Cart cart) {
        return new CartResponse(
                cart.getId(),
                cart.getMenuName(),
                cart.getQuantity(),
                cart.getUnitPrice(),
                cart.calculateTotalPrice()
        );
    }
}
