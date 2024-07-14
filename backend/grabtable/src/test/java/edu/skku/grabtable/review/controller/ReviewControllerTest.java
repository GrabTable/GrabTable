package edu.skku.grabtable.review.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.common.domain.response.SliceResponse;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.review.domain.ReviewPlatform;
import edu.skku.grabtable.review.domain.request.ReviewRequest;
import edu.skku.grabtable.review.domain.request.ReviewUpdateRequest;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import edu.skku.grabtable.review.service.ReviewService;
import java.util.ArrayList;
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

        SliceResponse<ReviewResponse> reviewResponseSlice = SliceResponse.of(reviewResponses, false, null);

        //given
        Mockito.when(reviewService.getAllReviewsByUser(USER_ID, null, 20)).thenReturn(reviewResponseSlice);

        //when
        mockMvc.perform(get("/v1/reviews/users/{id}", USER_ID))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService, Mockito.times(1)).getAllReviewsByUser(USER_ID, null, 20);
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

        SliceResponse<ReviewResponse> reviewResponseSlice = SliceResponse.of(reviewResponses, false, null);

        //given
        Mockito.when(reviewService.getAllReviewsByStore(STORE_ID, null, 20)).thenReturn(reviewResponseSlice);

        //when
        mockMvc.perform(get("/v1/reviews/stores/1"))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService, Mockito.times(1)).getAllReviewsByStore(STORE_ID, null, 20);
    }

    @Test
    @DisplayName("유저는 리뷰를 등록할 수 있다.")
    void uploadReview() throws Exception {

        //given
        User user = new User(1L, "userA", new ArrayList<>());
        ReviewRequest request = new ReviewRequest(1L, "good", 3.5);
        Mockito.doNothing().when(reviewService).upload(any(), any());

        //when
        mockMvc.perform(MockMvcRequestBuilders.post("/v1/reviews")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService).upload(any(), any());
    }

    @Test
    @DisplayName("유저는 리뷰를 수정할 수 있다.")
    void updateReview() throws Exception {

        //given
        ReviewUpdateRequest request = new ReviewUpdateRequest("good", 3.5);
        Mockito.doNothing().when(reviewService).update(
                ArgumentMatchers.anyLong(),
                ArgumentMatchers.anyLong(),
                any(),
                ArgumentMatchers.anyDouble());

        //when
        mockMvc.perform(MockMvcRequestBuilders.patch("/v1/reviews/1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService).update(
                any(),
                ArgumentMatchers.anyLong(),
                any(),
                ArgumentMatchers.anyDouble());
    }

    @Test
    @DisplayName("유저는 리뷰를 삭제할 수 있다.")
    void deleteReview() throws Exception {
        //given
        Mockito.doNothing().when(reviewService).delete(
                ArgumentMatchers.anyLong(),
                ArgumentMatchers.anyLong());

        //when
        mockMvc.perform(MockMvcRequestBuilders.delete("/v1/reviews/{reviewId}", "1"))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        Mockito.verify(reviewService).delete(
                any(),
                ArgumentMatchers.anyLong()
        );
    }
}