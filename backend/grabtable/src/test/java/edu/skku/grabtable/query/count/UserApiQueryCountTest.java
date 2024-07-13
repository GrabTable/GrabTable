package edu.skku.grabtable.query.count;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.user.domain.request.UserUpdateRequest;
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
        value = "classpath:data/users.sql"
)
public class UserApiQueryCountTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private ObjectMapper objectMapper;


    @Test
    @DisplayName("GET /v1/user/me 쿼리 개수 측정")
    void countGetV1UserMe() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(1L));

        mockMvc.perform(get("/v1/users/me")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken())))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("PATCH /v1/user 쿼리 개수 측정")
    void countPatchV1User() throws Exception {
        final UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(1L));
        UserUpdateRequest userUpdateRequest = new UserUpdateRequest("testUrl", "userA", "email", "phone");

        mockMvc.perform(patch("/v1/users")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(userUpdateRequest)))
                .andExpect(status().isOk())
                .andReturn();
    }
}
