package edu.skku.grabtable.order.domain.response;

import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.order.domain.Order;
import java.util.List;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class OrderResponse {
    private Long id;
    private Long userId;
    private List<CartResponse> carts;
    private String status;

    public static OrderResponse of(Order order, Long userId, List<CartResponse> carts) {
        return new OrderResponse(
                order.getId(),
                userId,
                carts,
                order.getStatus().toString()
        );
    }
}
