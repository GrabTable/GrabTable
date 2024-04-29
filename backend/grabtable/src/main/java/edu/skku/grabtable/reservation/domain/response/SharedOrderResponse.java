package edu.skku.grabtable.reservation.domain.response;

import java.util.List;

public class SharedOrderResponse {
    private Long id;
    private Integer userNum;
    private List<CartResponse> carts;
    private String status;
}
