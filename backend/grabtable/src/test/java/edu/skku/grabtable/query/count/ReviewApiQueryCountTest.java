package edu.skku.grabtable.query.count;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.review.domain.request.ReviewRequest;
import jakarta.servlet.http.Cookie;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
@Sql(value = {
        "classpath:data/stores.sql",
        "classpath:data/reviews.sql",
        "classpath:data/users.sql"
})
public class ReviewApiQueryCountTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private JwtUtil jwtUtil;

    @Test
    @DisplayName("GET /v1/reviews/users/{userId} 쿼리 개수 측정")
    void countGetV1ReviewsUsersUserId() throws Exception {
        mockMvc.perform(get("/v1/reviews/users/{userId}", 1L)
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("GET /v1/reviews/stores/{storeId} 쿼리 개수 측정")
    void countGetV1ReviewsStoresStoreId() throws Exception {
        mockMvc.perform(get("/v1/reviews/stores/{storeId}", 1L)
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("POST /v1/reviews 쿼리 개수 측정")
    void countPostV1ReviewsReviewId() throws Exception {
        ReviewRequest reviewRequest = new ReviewRequest(1L, "message", 5.0);
        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(1L));
        mockMvc.perform(post("/v1/reviews")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(reviewRequest)))
                .andExpect(status().isCreated())
                .andReturn();
    }

//    @Test
//    @DisplayName("PATCH /v1/reviews/{reviewId}")
//    void countPatchV1ReviewsReviewId() throws Exception {
//        ReviewUpdateRequest updateRequest = new ReviewUpdateRequest("updatedMessage", 5.0);
//        mockMvc.perform(patch("/v1/reviews/{reviewId}", 1L)
//                        .contentType(MediaType.APPLICATION_JSON)
//                        .content(objectMapper.writeValueAsString(updateRequest)))
//                .andExpect(status().isCreated())
//                .andReturn();
//    }

//    @Test
//    @DisplayName("DELETE /v1/reviews/{reviewId}")
//    void countDeleteV1ReviewsReviewId() throws Exception {
//        mockMvc.perform(delete("/v1/reviews/{reviewId}", 1L)
//                        .contentType(MediaType.APPLICATION_JSON))
//                .andExpect(status().isNoContent())
//                .andReturn();
//    }


}
