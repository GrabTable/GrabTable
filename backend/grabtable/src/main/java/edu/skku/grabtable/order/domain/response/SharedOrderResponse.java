package edu.skku.grabtable.order.domain.response;

import edu.skku.grabtable.cart.domain.response.CartResponse;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class SharedOrderResponse {
    private Long id;
    private List<CartResponse> carts;
    private List<OrderResponse> orders;
    private Integer totalAmount;
    private Integer leftAmount;

    public static SharedOrderResponse of(Long id, List<CartResponse> carts, List<OrderResponse> orders,
                                         Integer totalAmount, Integer leftAmount) {
        return new SharedOrderResponse(id, carts, orders, totalAmount, leftAmount);
    }
}
