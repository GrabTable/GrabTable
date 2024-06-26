package edu.skku.grabtable.review.domain.response;

import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.review.domain.ReviewPlatform;
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

        final String username = (review.getUser() == null) ? null : review.getUser().getUsername();

        return new ReviewResponse(
                review.getId(),
                username,
                review.getStore().getStoreName(),
                review.getReviewPlatform(),
                review.getMessage(),
                review.getRating()
        );
    }
}
