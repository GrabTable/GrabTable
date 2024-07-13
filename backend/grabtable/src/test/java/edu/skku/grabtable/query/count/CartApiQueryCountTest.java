package edu.skku.grabtable.query.count;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.cart.domain.request.CartCreateRequest;
import edu.skku.grabtable.cart.domain.request.CartUpdateRequest;
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
        value = {"classpath:data/users.sql",
                "classpath:data/stores.sql",
                "classpath:data/menus.sql",
                "classpath:data/shared_orders.sql",
                "classpath:data/reservations.sql",
                "classpath:data/carts.sql"}
)
public class CartApiQueryCountTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    @DisplayName("GET /v1/carts/me 쿼리 개수 측정")
    void countGetV1CartsMe() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));

        mockMvc.perform(get("/v1/carts/me")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("POST /v1/carts 쿼리 개수 측정")
    void countPostV1Carts() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));
        CartCreateRequest cartCreateRequest = new CartCreateRequest(1L, 1000);

        mockMvc.perform(post("/v1/carts")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(cartCreateRequest)))
                .andExpect(status().isCreated())
                .andReturn();
    }

    @Test
    @DisplayName("PATCH /v1/carts/{cartId} 쿼리 개수 측정")
    void countPatchV1CartsCartId() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));
        CartUpdateRequest updateRequest = new CartUpdateRequest(10);

        mockMvc.perform(patch("/v1/carts/{cartId}", 1)
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(updateRequest)))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("DELETE /v1/carts/{cartId} 쿼리 개수 측정")
    void countDeleteV1CartsCartId() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));

        mockMvc.perform(delete("/v1/carts/{cartId}", 1)
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isNoContent())
                .andReturn();
    }

    @Test
    @DisplayName("POST /v1/carts/shared 쿼리 개수 측정")
    void countPostV1CartsShared() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));
        CartCreateRequest cartCreateRequest = new CartCreateRequest(1L, 1000);

        mockMvc.perform(post("/v1/carts/shared")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(cartCreateRequest)))
                .andExpect(status().isCreated())
                .andReturn();
    }

    @Test
    @DisplayName("PATCH /v1/carts/shared/{cartId} 쿼리 개수 측정")
    void countPatchV1CartsSharedCartId() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));
        CartUpdateRequest updateRequest = new CartUpdateRequest(10);

        mockMvc.perform(patch("/v1/carts/shared/{cartId}", 2)
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(updateRequest)))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("DELETE /v1/carts/shared/{cartId} 쿼리 개수 측정")
    void countDeleteV1CartsSharedCartId() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));

        mockMvc.perform(delete("/v1/carts/shared/{cartId}", 2)
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isNoContent())
                .andReturn();
    }
}
