package edu.skku.grabtable.review.service;

import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.review.domain.request.ReviewRequest;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import edu.skku.grabtable.review.domain.response.ReviewSummaryResponse;
import edu.skku.grabtable.review.repository.ReviewRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.StoreRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class ReviewService {

    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;
    private final StoreRepository storeRepository;


    @Transactional(readOnly = true)
    public List<ReviewResponse> getAllReviewsByUser(Long userId) {
//        User user = userRepository.findById(userId)
//                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        List<Review> reviews = reviewRepository.findByUserId(userId);

        return reviews.stream().map(ReviewResponse::of).toList();
    }

    @Transactional(readOnly = true)
    public List<ReviewResponse> getAllReviewsByStore(Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));

        return store.getReviews().stream().map(ReviewResponse::of).toList();
    }

    public void delete(Long userId, Long reviewId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_REVIEW_ID));

        User user = review.getUser();
        if (user == null || !Objects.equals(user.getId(), userId)) {
            throw new BadRequestException(ExceptionCode.INVALID_REQUEST);
        }

        reviewRepository.delete(review);
    }

    public void update(Long userId, Long reviewId, String message, Double rating) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));
        User user = review.getUser();
        if (user == null || !Objects.equals(user.getId(), userId)) {
            throw new BadRequestException(ExceptionCode.INVALID_REQUEST);
        }
        review.update(message, rating);
    }

    public void upload(Long userId, ReviewRequest request) {
        Store store = storeRepository.findById(request.getStoreId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        Review review = Review.of(store, user, request.getMessage(), request.getRating());
        reviewRepository.save(review);
    }

    @Transactional(readOnly = true)
    public ReviewSummaryResponse getReviewSummaryByStore(Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));

        List<Review> reviews = store.getReviews();

        double totalAverageRating = calculateAverageRating(reviews);
        Map<String, Double> ratingOfPlatforms = calculatePlatformRatings(reviews);
        Map<String, List<ReviewResponse>> reviewsOfPlatforms = groupReviewsByPlatform(reviews);
        boolean hasRisk = hasManipulatedRisk(new ArrayList<>(ratingOfPlatforms.values()));

        return new ReviewSummaryResponse(storeId, store.getStoreName(), totalAverageRating,
                ratingOfPlatforms, hasRisk, reviewsOfPlatforms);
    }

    private Map<String, List<ReviewResponse>> groupReviewsByPlatform(List<Review> reviews) {
        return reviews.stream()
                .collect(Collectors.groupingBy(review -> review.getReviewPlatform().toString(),
                        Collectors.mapping(ReviewResponse::of, Collectors.toList())));
    }

    private Map<String, Double> calculatePlatformRatings(List<Review> reviews) {
        return reviews.stream()
                .collect(Collectors.groupingBy(review -> review.getReviewPlatform().toString(),
                        Collectors.averagingDouble(review -> review.getRating() != null ? review.getRating() : 0.0)));
    }

    private double calculateAverageRating(List<Review> reviews) {
        return reviews.stream()
                .filter(review -> review.getRating() != null)
                .mapToDouble(Review::getRating)
                .average()
                .orElse(0.0);
    }

    private boolean hasManipulatedRisk(List<Double> platformRatings) {
        final double MANIPULATED_RISK_RATING_GAP = 1.0;
        if (platformRatings.isEmpty()) {
            return false;
        }

        Double min_rating = platformRatings.stream().min(Double::compareTo).get();
        Double max_rating = platformRatings.stream().max(Double::compareTo).get();
        return min_rating > 0.0 && max_rating - min_rating > MANIPULATED_RISK_RATING_GAP;
    }
}
