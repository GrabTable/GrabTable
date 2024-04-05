package edu.skku.grabtable.auth.service;

import edu.skku.grabtable.auth.domain.response.KakaoAccessResponseDto;
import edu.skku.grabtable.auth.domain.response.KakaoUserInfoResponseDto;
import edu.skku.grabtable.common.exception.BusinessException;
import edu.skku.grabtable.common.exception.ErrorCode;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
public class KakaoAuthService {
    private static final String OAUTH_ENDPOINT = "https://kauth.kakao.com/oauth/token";
    private static final String USERINFO_ENDPOINT = "https://kapi.kakao.com/v2/user/me";
    private static final String OAUTH_UNLINK_ENDPOINT = "https://kapi.kakao.com/v1/user/unlink";

    private final KakaoAuthProperties kakaoAuthProperties;
    private final RestTemplate restTemplate;

    public String getAccessToken(String authenticationCode) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            params.add("grant_type", "authorization_code");
//            params.add("client_id", "5b41d5a0ea1ba89951211349a0b8f5bd");
            params.add("client_id", kakaoAuthProperties.getAdminKey());
            params.add("redirect_uri", "http://localhost:8000/v1/auth/login/kakao");
            params.add("code", authenticationCode);
            HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

            ResponseEntity<KakaoAccessResponseDto> response = restTemplate.exchange(
                    OAUTH_ENDPOINT, HttpMethod.POST, entity, KakaoAccessResponseDto.class);
//            System.out.println(response.getBody());
            return Objects.requireNonNull(response.getBody()).access_token();
        } catch (RestClientException e) {
            throw new RuntimeException(e);
        }
    }

    public String getSocialLoginId(String oauthToken) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(oauthToken);
            HttpEntity<String> entity = new HttpEntity<>(headers);

            ResponseEntity<KakaoUserInfoResponseDto> response = restTemplate.exchange(
                    USERINFO_ENDPOINT, HttpMethod.GET, entity, KakaoUserInfoResponseDto.class);
            KakaoUserInfoResponseDto kakaoUserResponseDto = response.getBody();
//            System.out.println(response.getBody());
            if (kakaoUserResponseDto == null) {
                throw new BusinessException(ErrorCode.INVALID_KAKAO_AUTH_TOKEN);
            }
            return kakaoUserResponseDto.id().toString();
        } catch (HttpClientErrorException e) {
            throw new BusinessException(ErrorCode.INVALID_KAKAO_AUTH_TOKEN);
        } catch (HttpServerErrorException e) {
            throw new BusinessException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }
}
