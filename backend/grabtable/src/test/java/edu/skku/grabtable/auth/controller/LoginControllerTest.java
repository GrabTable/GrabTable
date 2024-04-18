package edu.skku.grabtable.auth.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.auth.domain.request.LoginRequest;
import edu.skku.grabtable.auth.domain.response.AccessTokenResponse;
import edu.skku.grabtable.auth.repository.RefreshTokenRepository;
import edu.skku.grabtable.auth.service.LoginService;
import edu.skku.grabtable.common.ControllerTest;
import jakarta.servlet.http.Cookie;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;

@WebMvcTest(LoginController.class)
@AutoConfigureRestDocs
class LoginControllerTest extends ControllerTest {

    private static final String ACCESS_TOKEN = "access_token";
    private static final String REISSUED_ACCESS_TOKEN = "reissued_access_token";
    private static final String REFRESH_TOKEN = "refresh_token";
    private static final String CODE = "code";
    @Autowired
    ObjectMapper objectMapper;

    @MockBean
    LoginService loginService;

    @MockBean
    RefreshTokenRepository refreshTokenRepository;

    @MockBean
    JwtUtil jwtUtil;

    @Test
    @DisplayName("카카오 소셜 로그인을 할 수 있다.")
    void kakaoSocialLogin() throws Exception {
        //given
        LoginRequest loginRequest = new LoginRequest(CODE);

        Mockito.when(loginService.login(ArgumentMatchers.any()))
                .thenReturn(new UserTokens(REFRESH_TOKEN, ACCESS_TOKEN));
        //when
        MvcResult mvcResult = mockMvc.perform(post("/v1/auth/login/kakao")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(loginRequest)))
                .andExpect(status().isOk())
                .andReturn();
        //then
        AccessTokenResponse accessTokenResponse = objectMapper.readValue(
                mvcResult.getResponse().getContentAsString(),
                AccessTokenResponse.class
        );

        assertThat(accessTokenResponse.getAccessToken()).isEqualTo(ACCESS_TOKEN);
    }

    @Test
    @DisplayName("Access Token을 재발급받을 수 있다.")
    void reissueToken() throws Exception {
        //given
        Mockito.when(loginService.reissueAccessToken(REFRESH_TOKEN, ACCESS_TOKEN))
                .thenReturn(REISSUED_ACCESS_TOKEN);

        //when
        MvcResult mvcResult = mockMvc.perform(post("/v1/auth/reissue")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, ACCESS_TOKEN)
                        .cookie(new Cookie("refresh-token", REFRESH_TOKEN)))
                .andExpect(status().isOk())
                .andReturn();

        AccessTokenResponse accessTokenResponse = objectMapper.readValue(
                mvcResult.getResponse().getContentAsString(),
                AccessTokenResponse.class
        );

        assertThat(accessTokenResponse.getAccessToken()).isEqualTo(REISSUED_ACCESS_TOKEN);

    }

    @Test
    @DisplayName("로그아웃할 수 있다.")
    void logout() throws Exception {
        //given
        Mockito.doNothing().when(loginService).logout(ArgumentMatchers.any());

        //when
        mockMvc.perform(post("/v1/auth/logout")
                        .header(HttpHeaders.AUTHORIZATION, ACCESS_TOKEN)
                        .cookie(new Cookie("refresh-token", REFRESH_TOKEN)))
                .andExpect(status().isNoContent());

        //then
        Mockito.verify(loginService).logout(ArgumentMatchers.any());
    }


}