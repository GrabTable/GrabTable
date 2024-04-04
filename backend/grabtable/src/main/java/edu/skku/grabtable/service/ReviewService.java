package edu.skku.grabtable.service;

import edu.skku.grabtable.domain.Review;
import edu.skku.grabtable.domain.Store;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.domain.request.ReviewRequest;
import edu.skku.grabtable.domain.response.ReviewResponse;
import edu.skku.grabtable.exception.BadRequestException;
import edu.skku.grabtable.exception.ExceptionCode;
import edu.skku.grabtable.repository.ReviewRepository;
import edu.skku.grabtable.repository.StoreRepository;
import edu.skku.grabtable.repository.UserRepository;
import java.util.List;
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
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        return user.getReviews().stream().map(ReviewResponse::of).toList();
    }

    @Transactional(readOnly = true)
    public List<ReviewResponse> getAllReviewsByStore(Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));

        return store.getReviews().stream().map(ReviewResponse::of).toList();
    }

    public void delete(Long reviewId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_REVIEW_ID));
        reviewRepository.delete(review);
    }

    public void update(Long reviewId, String message, Double rating) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));
        review.update(message, rating);
    }

    public void upload(ReviewRequest request) {
        Store store = storeRepository.findById(request.getStoreId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));
        User user = userRepository.findById(request.getUserId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));

        Review review = Review.of(store, user, request.getMessage(), request.getRating());
        reviewRepository.save(review);
    }
}
