package edu.skku.grabtable.integration;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.auth.domain.request.LoginRequest;
import edu.skku.grabtable.auth.infrastructure.KakaoOAuthProvider;
import edu.skku.grabtable.auth.infrastructure.KakaoUserInfo;
import edu.skku.grabtable.auth.repository.RefreshTokenRepository;
import edu.skku.grabtable.auth.service.LoginService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
@Transactional
public class LoginIntegrationTest {

    @MockBean
    KakaoOAuthProvider kakaoOAuthProvider;

    @Autowired
    ObjectMapper objectMapper;

    @Autowired
    LoginService loginService;

    @Autowired
    RefreshTokenRepository refreshTokenRepository;

    private KakaoUserInfo buildUserInfo() throws JsonProcessingException {
        String response = """
                { "id":1,
                "kakao_account" : {
                    "profile" : {
                        "nickname" : "userA",
                        "profile_image_url" : "test_url" }
                     }
                 }
                """;
        return objectMapper.readValue(response, KakaoUserInfo.class);
    }

    @Test
    @DisplayName("사용자가 소셜 로그인을 할 수 있다.")
    void socialLogin() throws Exception {
        //given
        given(kakaoOAuthProvider.getUserInfo(any()))
                .willReturn(buildUserInfo());

        //when
        UserTokens tokens = loginService.login(new LoginRequest("code"));

        //then
        boolean present = refreshTokenRepository.findById(tokens.getRefreshToken()).isPresent();
        assertThat(present).isTrue();
    }


}
