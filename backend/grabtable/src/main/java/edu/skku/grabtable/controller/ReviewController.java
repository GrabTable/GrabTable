package edu.skku.grabtable.controller;

import edu.skku.grabtable.domain.request.ReviewRequest;
import edu.skku.grabtable.domain.request.ReviewUpdateRequest;
import edu.skku.grabtable.domain.response.ReviewResponse;
import edu.skku.grabtable.service.ReviewService;
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

    //밑의 모든 엔드포인트는 AUTH 모듈과 통합 필요
    @PostMapping
    public void upload(@RequestBody ReviewRequest request) {
        reviewService.upload(request);
    }

    @PatchMapping("/{reviewId}")
    public void update(@RequestBody ReviewUpdateRequest request,
                       @PathVariable Long reviewId) {
        reviewService.update(reviewId, request.getMessage(), request.getRating());
    }

    @DeleteMapping("/{reviewId}")
    public void delete(@PathVariable Long reviewId) {
        reviewService.delete(reviewId);
    }
}
