package edu.skku.grabtable.store.domain.response;

import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.store.domain.Store;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
public class StoreInfoResponse {
    private Long id;
    private String storeName;
    private Double latitude;
    private Double longitude;
    private String address;
    private String storePictureUrl;
    private String category;
    private Double averageRating;

    public static StoreInfoResponse of(Store store) {
        return new StoreInfoResponse(
                store.getId(),
                store.getStoreName(),
                store.getPosition().getLatitude(),
                store.getPosition().getLongitude(),
                store.getAddress(),
                store.getStorePictureUrl(),
                store.getCategory().toString(),
                calculateAverageRating(store.getReviews())
        );
    }

    private static double calculateAverageRating(List<Review> reviews) {
        return reviews.stream()
                .filter(review -> review.getRating() != null)
                .mapToDouble(Review::getRating)
                .average()
                .orElse(0.0);
    }
}
