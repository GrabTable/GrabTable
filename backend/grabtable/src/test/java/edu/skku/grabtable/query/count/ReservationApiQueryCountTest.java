package edu.skku.grabtable.query.count;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.reservation.domain.request.ReservationRequest;
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
@Sql(
        value = {
                "classpath:data/users.sql",
                "classpath:data/stores.sql",
                "classpath:data/shared_orders.sql",
                "classpath:data/reservations.sql",
                "classpath:data/orders.sql"
        }
)
public class ReservationApiQueryCountTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    @DisplayName("POST /v1/reservations 쿼리 개수 측정")
    void countPostV1Reservations() throws Exception {
        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(1L));
        ReservationRequest reservationRequest = new ReservationRequest(1L);

        mockMvc.perform(post("/v1/reservations")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(reservationRequest)))
                .andExpect(status().isCreated())
                .andReturn();
    }

    @Test
    @DisplayName("POST /v1/reservations/{inviteCode} 쿼리 개수 측정")
    void countPostV1ReservationsInviteCode() throws Exception {
        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(1L));

        mockMvc.perform(post("/v1/reservations/{inviteCode}", "testInviteCode")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isCreated())
                .andReturn();
    }

    @Test
    @DisplayName("GET /v1/reservations/me 쿼리 개수 측정")
    void countGetV1ReservationsMe() throws Exception {
        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));

        mockMvc.perform(get("/v1/reservations/me")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isOk())
                .andReturn();
    }

//    @Test
//    @DisplayName("GET /v1/reservations/me/subscribe 쿼리 개수 측정")
//    void countGetV1ReservationsMeSubscribe() throws Exception {
//        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));
//
//        //TODO: 쿼리 개수 출력 X
//        MvcResult mvcResult = mockMvc.perform(get("/v1/reservations/me/subscribe")
//                        .contentType(MediaType.TEXT_EVENT_STREAM)
//                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
//                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
//                .andExpect(status().isOk())
//                .andDo(MockMvcResultHandlers.print())
//                .andReturn();
//
//        mvcResult.getResponse().getOutputStream().close();
//    }

    @Test
    @DisplayName("POST /v1/reservations/confirm 쿼리 개수 측정")
    void countPostV1ReservationsConfirm() throws Exception {
        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));

        mockMvc.perform(post("/v1/reservations/confirm")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isCreated())
                .andReturn();
    }

    @Test
    @DisplayName("DELETE /v1/reservations 쿼리 개수 측정")
    void countDeleteV1Reservations() throws Exception {
        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));

        mockMvc.perform(delete("/v1/reservations")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isNoContent())
                .andReturn();
    }
}

