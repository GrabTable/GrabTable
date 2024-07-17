package edu.skku.grabtable.integration;

import edu.skku.grabtable.common.domain.response.SliceResponse;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.review.domain.ReviewStatus;
import edu.skku.grabtable.review.domain.request.ReviewRequest;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import edu.skku.grabtable.review.repository.ReviewRepository;
import edu.skku.grabtable.review.service.ReviewService;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import jakarta.persistence.EntityManager;
import java.util.List;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
@Sql(value = {
        "classpath:data/users.sql",
        "classpath:data/stores.sql",
        "classpath:data/reviews.sql"
})
public class ReviewIntegrationTest {

    @Autowired
    UserRepository userRepository;

    @Autowired
    StoreRepository storeRepository;

    @Autowired
    ReviewRepository reviewRepository;

    @Autowired
    ReviewService reviewService;

    @Autowired
    EntityManager em;

    @Test
    @DisplayName("리뷰 삭제 시 상태가 INVALID로 변경된다. (SOFT DELETE)")
    void uploadReview() {
        //given
        User user = User.builder()
                .username("userA")
                .password("1234")
                .email("userA@gmail.com")
                .phone("01012345678")
                .build();

        User savedUser = userRepository.save(user);
        User findUser = userRepository.findById(savedUser.getId()).get();
        Store store = storeRepository.findByStoreName("봉수육").get();
        reviewService.upload(findUser.getId(), new ReviewRequest(store.getId(), "맛있어요", 4.0));

        //when
        ReviewResponse reviewResponse = reviewService.getAllReviewsByUser(findUser.getId(), null, 20).getValues().get(0);
        System.out.println("findUser = " + findUser.getId());
        System.out.println("reviewResponse = " + reviewResponse);
        reviewService.delete(findUser.getId(), reviewResponse.getId());

        //then
        //NativeQuery를 통해 JPA 설정을 우회할 수 있다.
        Review deletedReview = (Review) em.createNativeQuery("select * from review where status = 'INVALID'",
                        Review.class)
                .getResultList().get(0);

        Assertions.assertThat(deletedReview.getStatus()).isEqualTo(ReviewStatus.INVALID);
    }

    @Test
    @DisplayName("유저 자신이 작성하지 않은 리뷰를 삭제할 수 없다.")
    void deleteReview_unauthorized() {
        //given
        User user = User.builder()
                .username("userA")
                .password("1234")
                .email("userA@gmail.com")
                .phone("01012345678")
                .build();

        userRepository.save(user);
        Store store = storeRepository.findByStoreName("봉수육").get();

        //when
        Long reviewId = store.getReviews().get(0).getId();

        //then
        Assertions.assertThatThrownBy(() -> {
                    reviewService.delete(user.getId(), reviewId);
                }).isInstanceOf(BadRequestException.class)
                .hasMessageContaining("유효하지 않은 요청입니다.");

    }

    @Test
    @DisplayName("Cursor 값이 null 이면 가장 최신 리뷰부터 size만큼의 리뷰를 조회한다.")
    void readReviewsFirst() {
        //given
        Store store = storeRepository.findByStoreName("쟈스민").get();

        //when
        SliceResponse<ReviewResponse> response = reviewService.getAllReviewsByStore(store.getId(), null, 20);

        //then
        Assertions.assertThat(response.getHasNext()).isTrue();
        Assertions.assertThat(response.getValues().size()).isEqualTo(20);
        Assertions.assertThat(response.getCursor()).isPositive();
    }

    @Test
    @DisplayName("마지막 리뷰를 조회하면 다음 커서값에 null 이 들어간다.")
    void readReviewLast() {
        //given
        Store store = storeRepository.findByStoreName("쟈스민").get();

        //when
        SliceResponse<ReviewResponse> response = reviewService.getAllReviewsByStore(store.getId(), 220L, 20);

        //then
        Assertions.assertThat(response.getHasNext()).isFalse();
        Assertions.assertThat(response.getCursor()).isEqualTo(null);
    }
}
