package edu.skku.grabtable.review.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.review.domain.request.ReviewRequest;
import edu.skku.grabtable.review.domain.request.ReviewUpdateRequest;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import edu.skku.grabtable.review.domain.response.ReviewSummaryResponse;
import edu.skku.grabtable.review.service.ReviewService;
import jakarta.validation.Valid;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/reviews")
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    @GetMapping("/users/{userId}")
    public List<ReviewResponse> getAllReviewsByUser(@PathVariable Long userId) {
        return reviewService.getAllReviewsByUser(userId);
    }

    @GetMapping("/stores/{storeId}")
    public List<ReviewResponse> getAllReviewsByStore(@PathVariable Long storeId) {
        return reviewService.getAllReviewsByStore(storeId);
    }

    @GetMapping("stores/{storeId}/summary")
    public ReviewSummaryResponse getReviewSummaryByStore(@PathVariable Long storeId) {
        return reviewService.getReviewSummaryByStore(storeId);
    }

    @PostMapping
    public void upload(
            @AuthUser User user,
            @RequestBody @Valid ReviewRequest request
    ) {
        reviewService.upload(user.getId(), request);
    }

    @PatchMapping("/{reviewId}")
    public void update(
            @AuthUser User user,
            @RequestBody @Valid ReviewUpdateRequest request,
            @PathVariable Long reviewId
    ) {
        reviewService.update(user.getId(), reviewId, request.getMessage(), request.getRating());
    }

    @DeleteMapping("/{reviewId}")
    public void delete(
            @AuthUser User user,
            @PathVariable Long reviewId
    ) {
        reviewService.delete(user.getId(), reviewId);
    }
}
