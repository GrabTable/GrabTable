package edu.skku.grabtable.order.domain.response;

import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.order.domain.Order;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@ToString
@Getter
public class OrderResponse {
    private Long id;
    private Long userId;
    private List<CartResponse> carts;
    private String status;

    public static OrderResponse of(Order order) {
        return new OrderResponse(
                order.getId(),
                order.getUser().getId(),
                order.getCarts().stream().map(CartResponse::of).toList(),
                order.getStatus().toString()
        );
    }

    public static OrderResponse of(Long orderId, Long userId, List<CartResponse> carts, String status) {
        return new OrderResponse(orderId, userId, carts, status);
    }
}
