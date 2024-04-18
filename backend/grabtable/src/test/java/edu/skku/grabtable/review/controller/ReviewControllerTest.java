package edu.skku.grabtable.review.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.review.domain.ReviewPlatform;
import edu.skku.grabtable.review.domain.request.ReviewRequest;
import edu.skku.grabtable.review.domain.request.ReviewUpdateRequest;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import edu.skku.grabtable.review.service.ReviewService;
import java.util.List;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@WebMvcTest(ReviewController.class)
@AutoConfigureRestDocs
class ReviewControllerTest extends ControllerTest {


    @MockBean
    private ReviewService reviewService;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    @DisplayName("유저가 작성한 리뷰를 조회할 수 있다.")
    void getAllReviewsByUserId() throws Exception {
        final Long USER_ID = 1L;

        List<ReviewResponse> reviewResponses = List.of(
                new ReviewResponse(1L, "userA", "storeA",
                        ReviewPlatform.GRABTABLE, "맛있어요.", 5.0),
                new ReviewResponse(2L, "userA", "storeB",
                        ReviewPlatform.GRABTABLE, "Yummy.", 5.0),
                new ReviewResponse(3L, "userA", "storeC",
                        ReviewPlatform.GRABTABLE, "별로였어요.", 1.0)
        );

        //given
        Mockito.when(reviewService.getAllReviewsByUser(USER_ID)).thenReturn(reviewResponses);

        //when
        mockMvc.perform(get("/v1/reviews/users/{id}", "1"))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService, Mockito.times(1)).getAllReviewsByUser(ArgumentMatchers.anyLong());

    }

    @Test
    @DisplayName("가게의 리뷰를 조회할 수 있다.")
    void getAllReviewsByStoreId() throws Exception {
        final Long STORE_ID = 1L;

        List<ReviewResponse> reviewResponses = List.of(
                new ReviewResponse(1L, "userA", "storeA",
                        ReviewPlatform.GRABTABLE, "맛있어요.", 5.0),
                new ReviewResponse(2L, "userA", "storeA",
                        ReviewPlatform.GRABTABLE, "Yummy.", 5.0),
                new ReviewResponse(3L, "userA", "storeA",
                        ReviewPlatform.GRABTABLE, "별로였어요.", 1.0)
        );

        //given
        Mockito.when(reviewService.getAllReviewsByStore(STORE_ID)).thenReturn(reviewResponses);

        //when
        mockMvc.perform(get("/v1/reviews/stores/1"))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService, Mockito.times(1)).getAllReviewsByStore(ArgumentMatchers.anyLong());
    }

    @Test
    @DisplayName("유저는 리뷰를 등록할 수 있다.")
    void UploadReview() throws Exception {

        //given
        ReviewRequest request = new ReviewRequest(1L, 1L, "good", 3.5);
        Mockito.doNothing().when(reviewService).upload(ArgumentMatchers.any());

        //when
        mockMvc.perform(MockMvcRequestBuilders.post("/v1/reviews")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService).upload(ArgumentMatchers.any());
    }

    @Test
    @DisplayName("유저는 리뷰를 수정할 수 있다.")
    void UpdateReview() throws Exception {

        //given
        ReviewUpdateRequest request = new ReviewUpdateRequest("good", 3.5);
        Mockito.doNothing().when(reviewService).update(
                ArgumentMatchers.anyLong(),
                ArgumentMatchers.any(),
                ArgumentMatchers.anyDouble());

        //when
        mockMvc.perform(MockMvcRequestBuilders.patch("/v1/reviews/1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService).update(
                ArgumentMatchers.anyLong(),
                ArgumentMatchers.any(),
                ArgumentMatchers.anyDouble());
    }
}