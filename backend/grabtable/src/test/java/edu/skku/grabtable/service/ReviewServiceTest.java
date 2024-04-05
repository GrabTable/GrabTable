package edu.skku.grabtable.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import edu.skku.grabtable.domain.Review;
import edu.skku.grabtable.domain.Store;
import edu.skku.grabtable.domain.StoreCategory;
import edu.skku.grabtable.domain.StoreStatus;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.domain.response.ReviewResponse;
import edu.skku.grabtable.repository.ReviewRepository;
import edu.skku.grabtable.repository.StoreRepository;
import edu.skku.grabtable.repository.UserRepository;
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
        User user = new User(1L, "a", "b", "c", "d", new ArrayList<>());
        Store store = new Store("Ramen", "Seoul");
        Review review = Review.of(store, user, "a", 3.0);
        Review review2 = Review.of(store, user, "b", 4.0);
        user.getReviews().add(review);
        user.getReviews().add(review2);

        when(userRepository.findById(any(Long.class))).thenReturn(Optional.of(user));

        //when
        List<ReviewResponse> result = reviewService.getAllReviewsByUser(user.getId());

        //then
        assertThat(result.size()).isEqualTo(2);
    }

    @Test
    @DisplayName("Store ID로 가게의 모든 리뷰를 조회할 수 있다")
    void findReviewsByStoreId() {
        //given
        User user = new User(1L, "a", "b", "c", "d", new ArrayList<>());
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>());
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


}