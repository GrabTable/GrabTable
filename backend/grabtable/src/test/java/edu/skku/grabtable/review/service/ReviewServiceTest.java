package edu.skku.grabtable.review.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import edu.skku.grabtable.common.domain.response.SliceResponse;
import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.review.domain.ReviewPlatform;
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
import java.util.Arrays;
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
    @DisplayName("사용자가 작성한 리뷰를 조회하는데 다음 페이지가 존재하지 않는 경우에는 hasNext=false, Cursor=null 이 반환된다.")
    void findReviewsByUserIdLastPage() {
        //given
        List<ReviewResponse> reviewResponses = new ArrayList<>();
        reviewResponses.add(new ReviewResponse(2L, "userA", "storeA",
                ReviewPlatform.GRABTABLE, "맛있어요.", 5.0));
        reviewResponses.add(new ReviewResponse(1L, "userA", "storeB",
                ReviewPlatform.GRABTABLE, "Yummy.", 5.0));

        when(reviewRepository.findByUserIdBeforeCursor(any(Long.class), any(Long.class), any(int.class)))
                .thenReturn(reviewResponses);

        //when
        SliceResponse<ReviewResponse> result = reviewService.getAllReviewsByUser(1L, 1L, 20);

        //then
        assertThat(result.getHasNext()).isFalse();
        assertThat(result.getValues().size()).isEqualTo(2);
        assertThat(result.getCursor()).isEqualTo(null);
    }

    @Test
    @DisplayName("사용자가 작성한 리뷰를 조회하는데 다음 페이지가 존재하면 hasNext=true, Cursor에는 마지막 Review Id가 반환된다.")
    void findReviewsByUserIdNotLastPage() {
        //given
        List<ReviewResponse> reviewResponses = new ArrayList<>();
        reviewResponses.add(new ReviewResponse(2L, "userA", "storeA",
                ReviewPlatform.GRABTABLE, "맛있어요.", 5.0));
        reviewResponses.add(new ReviewResponse(1L, "userA", "storeB",
                ReviewPlatform.GRABTABLE, "Yummy.", 5.0));

        when(reviewRepository.findByUserIdBeforeCursor(any(Long.class), any(Long.class), any(int.class)))
                .thenReturn(reviewResponses);

        //when
        SliceResponse<ReviewResponse> result = reviewService.getAllReviewsByUser(1L, 3L, 1);

        //then
        assertThat(result.getHasNext()).isTrue();
        assertThat(result.getValues().size()).isEqualTo(1);
        assertThat(result.getCursor()).isEqualTo(2L);
    }

    @Test
    @DisplayName("Store ID로 가게의 모든 리뷰를 조회할 수 있다")
    void findReviewsByStoreId() {
        //given
        User user = new User(1L, "userA", new ArrayList<>());
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>(), new ArrayList<>());
        Review review = Review.of(store, user, "a", 3.0);
        Review review2 = Review.of(store, user, "b", 4.0);

        when(storeRepository.findById(any(Long.class))).thenReturn(Optional.of(store));
        when(reviewRepository.findByStoreIdBeforeCursor(any(Long.class), any(), any(int.class)))
                .thenReturn(List.of(ReviewResponse.of(review2), ReviewResponse.of(review)));

        //when
        SliceResponse<ReviewResponse> result = reviewService.getAllReviewsByStore(store.getId(),
                null, 20);

        //then
        assertThat(result.getValues().size()).isEqualTo(2);
        assertThat(result.getHasNext()).isFalse();
        assertThat(result.getCursor()).isEqualTo(null);
    }

    @Test
    @DisplayName("가게 리뷰 요약을 조회할 수 있다.")
    void getReviewSummary() {
        //given
        User user = new User(1L, "userA", new ArrayList<>());
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null, null,
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