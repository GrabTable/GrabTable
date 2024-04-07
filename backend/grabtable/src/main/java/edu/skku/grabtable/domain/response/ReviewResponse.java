package edu.skku.grabtable.domain.response;

import edu.skku.grabtable.domain.Review;
import edu.skku.grabtable.domain.ReviewPlatform;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
public class ReviewResponse {
    private Long id;
    private String username;
    private String storeName;
    private ReviewPlatform reviewPlatform;
    private String message;
    private Double rating;

    public static ReviewResponse of(Review review) {
        return new ReviewResponse(
                review.getId(),
                review.getUser().getUsername(),
                review.getStore().getStoreName(),
                review.getReviewPlatform(),
                review.getMessage(),
                review.getRating()
        );
    }
}
