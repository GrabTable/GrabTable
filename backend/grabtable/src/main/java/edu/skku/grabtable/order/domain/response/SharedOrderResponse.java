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

    public static SharedOrderResponse of(Long id, List<CartResponse> carts, List<OrderResponse> orders) {
        return new SharedOrderResponse(id, carts, orders);
    }
}
