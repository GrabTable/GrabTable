package edu.skku.grabtable.order.domain.response;

import edu.skku.grabtable.reservation.domain.response.CartResponse;
import java.util.List;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class OrderResponse {
    private Long id;
    private Long userId;
    private List<CartResponse> carts;
    private String status;
}
