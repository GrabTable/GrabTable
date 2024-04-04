package edu.skku.grabtable.domain.request;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ReviewRequest {

    private Long userId;
    private Long storeId;
    private String message;
    private Double rating;
}
