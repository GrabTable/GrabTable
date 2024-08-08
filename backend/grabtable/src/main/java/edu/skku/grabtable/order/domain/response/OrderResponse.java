package edu.skku.grabtable.order.domain.response;

import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.order.domain.Order;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
public class OrderResponse {
    private Long id;
    private Long userId;
    private List<CartResponse> carts;
    private Integer paidAmount;
    private String status;

    public static OrderResponse from(Order order) {
        return new OrderResponse(
                order.getId(),
                order.getUser().getId(),
                order.getCarts().stream().map(CartResponse::of).toList(),
                order.getTotalPrice(),
                order.getStatus().toString()
        );
    }

    public static OrderResponse from(Long orderId, Long userId, List<CartResponse> carts, Integer paidAmount,
                                     String status) {
        return new OrderResponse(orderId, userId, carts, paidAmount, status);
    }
}
