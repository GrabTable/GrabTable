package edu.skku.grabtable.reservation.domain.response;

import java.util.List;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class OrderResponse {
    private Long id;
    private Long userId;
    private List<CartResponse> carts;
    private String status;
}
