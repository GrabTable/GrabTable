package edu.skku.grabtable.order.domain.response;

import edu.skku.grabtable.reservation.domain.response.CartResponse;
import java.util.List;

public class SharedOrderResponse {
    private Long id;
    private Integer userNum;
    private List<CartResponse> carts;
    private String status;
}
