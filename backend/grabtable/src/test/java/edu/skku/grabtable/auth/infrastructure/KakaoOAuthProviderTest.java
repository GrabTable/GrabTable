package edu.skku.grabtable.auth.infrastructure;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestTemplate;

@SpringBootTest
class KakaoOAuthProviderTest {


    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private KakaoOAuthProvider kakaoOAuthProvider;

    @Autowired
    private ObjectMapper objectMapper;

    @Value("${spring.security.oauth2.client.provider.kakao.token-uri}")
    private String tokenUri;
    @Value("${spring.security.oauth2.client.provider.kakao.user-info-uri}")
    private String userInfoUri;

    private MockRestServiceServer mockServer;


    @BeforeEach
    void setUp() {
        mockServer = MockRestServiceServer.createServer(restTemplate);
    }


    @Test
    @DisplayName("카카오 OAuth 서버에서 사용자 정보를 조회할 수 있다.")
    void getUserInfo() throws JsonProcessingException {
        //given
        String response = """
                { "id":1,
                "kakao_account" : {
                    "profile" : {
                        "nickname" : "userA",
                        "profile_image_url" : "test_url" }
                     }
                 }
                """;

        KakaoUserInfo expected = objectMapper.readValue(response, KakaoUserInfo.class);

        mockServer.expect(requestTo(userInfoUri))
                .andExpect(content().contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(method(HttpMethod.GET))
                .andRespond(withSuccess(response, MediaType.APPLICATION_JSON));

        //when
        KakaoUserInfo actual = kakaoOAuthProvider.getUserInfo("access-token");

        //then
        assertThat(actual).usingRecursiveComparison().isEqualTo(expected);
    }

    @Test
    @DisplayName("카카오 OAuth 서버에서 토큰을 발급받을 수 있다.")
    void fetchKakaoAccessToken() {
        //given
        String expected = "a";
        String response = """
                {"access_token" : "a",
                "refresh_token" : "b",
                "expires_in" : 10000}
                """;

        mockServer.expect(requestTo(tokenUri))
                .andExpect(content().contentType("application/x-www-form-urlencoded;charset=utf-8"))
                .andExpect(method(HttpMethod.POST))
                .andRespond(withSuccess(response, MediaType.APPLICATION_JSON));

        //when
        String actual = kakaoOAuthProvider.fetchKakaoAccessToken("code");

        //then
        assertThat(actual).isEqualTo(expected);
    }


}