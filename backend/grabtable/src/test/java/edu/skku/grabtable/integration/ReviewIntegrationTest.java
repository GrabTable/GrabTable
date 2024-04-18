package edu.skku.grabtable.integration;

import edu.skku.grabtable.domain.Store;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.repository.StoreRepository;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.review.domain.ReviewStatus;
import edu.skku.grabtable.review.domain.request.ReviewRequest;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import edu.skku.grabtable.review.repository.ReviewRepository;
import edu.skku.grabtable.review.service.ReviewService;
import jakarta.persistence.EntityManager;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;

@SpringBootTest
@Sql(value = {
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
        reviewService.upload(new ReviewRequest(findUser.getId(), store.getId(), "맛있어요", 4.0));
        ReviewResponse reviewResponse = reviewService.getAllReviewsByUser(findUser.getId()).get(0);

        //when
        reviewService.delete(reviewResponse.getId());

        //then

        //NativeQuery를 통해 JPA 설정을 우회할 수 있다.
        Review deletedReview = (Review) em.createNativeQuery("select * from review where status = 'INVALID'",
                        Review.class)
                .getResultList().get(0);

        Assertions.assertThat(deletedReview.getStatus()).isEqualTo(ReviewStatus.INVALID);
    }
}
