package edu.skku.grabtable.domain.request;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ReviewUpdateRequest {
    private String message;
    private Double rating;
}
