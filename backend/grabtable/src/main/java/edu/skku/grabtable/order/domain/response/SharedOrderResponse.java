package edu.skku.grabtable.order.domain.response;

import edu.skku.grabtable.cart.domain.response.CartResponse;
import java.util.List;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class SharedOrderResponse {
    private Long id;
    private Integer userNum;
    private List<CartResponse> carts;
    private String status;
}
