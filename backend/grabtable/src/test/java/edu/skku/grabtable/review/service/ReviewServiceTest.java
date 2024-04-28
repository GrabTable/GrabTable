package edu.skku.grabtable.review.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import edu.skku.grabtable.review.domain.response.ReviewSummaryResponse;
import edu.skku.grabtable.review.repository.ReviewRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.domain.StoreCategory;
import edu.skku.grabtable.store.domain.StoreStatus;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class ReviewServiceTest {

    @Mock
    ReviewRepository reviewRepository;

    @Mock
    UserRepository userRepository;

    @Mock
    StoreRepository storeRepository;

    @InjectMocks
    ReviewService reviewService;

    @Test
    @DisplayName("User ID로 유저가 작성한 모든 리뷰를 조회할 수 있다")
    void findReviewsByUserId() {
        //given
        User user = new User(1L, "userA", new ArrayList<>());
        Store store = new Store("Ramen", "Seoul");
        Review review = Review.of(store, user, "a", 3.0);
        Review review2 = Review.of(store, user, "b", 4.0);
        user.getReviews().add(review);
        user.getReviews().add(review2);

        when(reviewRepository.findByUserId(any(Long.class)))
                .thenReturn(List.of(review, review2));

        //when
        List<ReviewResponse> result = reviewService.getAllReviewsByUser(user.getId());

        //then
        assertThat(result.size()).isEqualTo(2);
    }

    @Test
    @DisplayName("Store ID로 가게의 모든 리뷰를 조회할 수 있다")
    void findReviewsByStoreId() {
        //given
        User user = new User(1L, "userA", new ArrayList<>());
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>(), new ArrayList<>());
        Review review = Review.of(store, user, "a", 3.0);
        Review review2 = Review.of(store, user, "b", 4.0);
        store.getReviews().add(review);
        store.getReviews().add(review2);

        when(storeRepository.findById(any(Long.class))).thenReturn(Optional.of(store));

        //when
        List<ReviewResponse> result = reviewService.getAllReviewsByStore(store.getId());

        //then
        assertThat(result.size()).isEqualTo(2);
    }

    @Test
    @DisplayName("가게 리뷰 요약을 조회할 수 있다.")
    void getReviewSummary() {
        //given
        User user = new User(1L, "userA", new ArrayList<>());
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>(), new ArrayList<>());
        Review review = Review.of(store, user, "a", 3.0);
        Review review2 = Review.of(store, user, "b", 4.0);
        store.getReviews().add(review);
        store.getReviews().add(review2);

        when(storeRepository.findById(any(Long.class))).thenReturn(Optional.of(store));

        //when
        ReviewSummaryResponse summary = reviewService.getReviewSummaryByStore(store.getId());

        //then
        assertThat(summary.getStoreId()).isEqualTo(1);
        assertThat(summary.getStoreName()).isEqualTo("Ramen");
        assertThat(summary.getManipulatedRisk()).isFalse();
        assertThat(summary.getTotalAverageRating()).isEqualTo(3.5);
        assertThat(summary.getPlatformRating()).containsEntry("GRABTABLE", 3.5);
        assertThat(summary.getPlatformReviews().get("GRABTABLE").size()).isEqualTo(2);
    }
}