package edu.skku.grabtable.domain.response;

import java.util.List;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ReviewSummaryResponse {
    private Long storeId;
    private String storeName;
    private Double totalAverageRating;
    private Map<String, Double> platformRating;
    private Boolean manipulatedRisk;
    private Map<String, List<ReviewResponse>> platformReviews;
}
