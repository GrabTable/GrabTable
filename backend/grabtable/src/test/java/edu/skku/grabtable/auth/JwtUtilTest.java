package edu.skku.grabtable.auth;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.common.exception.InvalidJwtException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class JwtUtilTest {

    private final String secretKey = "secretsecretsecretsecretsecretsecretsecretsecret";
    private final Long accessTokenExpiry = 100000L;
    private final Long refreshTokenExpiry = 1000000L;

    @Test
    @DisplayName("토큰을 파싱해 subject를 읽을 수 있다.")
    void getSubject() {
        //given
        JwtUtil jwtUtil = new JwtUtil(secretKey, accessTokenExpiry, refreshTokenExpiry);
        String expected = "1L";
        UserTokens loginToken = jwtUtil.createLoginToken(expected);
        String accessToken = loginToken.getAccessToken();

        //when
        String actual = jwtUtil.getSubject(accessToken);

        //then
        assertThat(actual).isEqualTo(expected);
    }

    @Test
    @DisplayName("위조된 RefreshToken 검증 시 InvalidJwtException 발생")
    void validate_refreshToken_fail() {
        //given
        JwtUtil jwtUtil = new JwtUtil(secretKey, accessTokenExpiry, refreshTokenExpiry);
        String fakeToken = "abc";

        //when & then
        assertThatThrownBy(() -> jwtUtil.validateRefreshToken(fakeToken))
                .isInstanceOf(InvalidJwtException.class)
                .hasMessageContaining(ExceptionCode.INVALID_REFRESH_TOKEN.getMessage());
    }

    @Test
    @DisplayName("위조된 AccessToken이면 거짓을 반환한다.")
    void accessToken_fake_then_return_false() {
        //given
        JwtUtil jwtUtil = new JwtUtil(secretKey, accessTokenExpiry, refreshTokenExpiry);
        String fakeToken = "abc";
        //when
        boolean result = jwtUtil.isAccessTokenValid(fakeToken);
        //then
        assertThat(result).isFalse();
    }

    @Test
    @DisplayName("만료된 AccessToken이면 참을 반환한다.")
    void accessToken_expired_then_return_true() {
        //given
        JwtUtil jwtUtil = new JwtUtil(secretKey, 0L, refreshTokenExpiry);
        String expected = "1L";
        UserTokens loginToken = jwtUtil.createLoginToken(expected);

        //when
        boolean result = jwtUtil.isAccessTokenExpired(loginToken.getAccessToken());

        //then
        assertThat(result).isTrue();
    }

    @Test
    @DisplayName("만료되지 않은 AccessToken이면 거짓을 반환한다.")
    void accessToken_not_expired_then_return_false() {
        //given
        JwtUtil jwtUtil = new JwtUtil(secretKey, 10000L, refreshTokenExpiry);
        String expected = "1L";
        UserTokens loginToken = jwtUtil.createLoginToken(expected);

        //when
        boolean result = jwtUtil.isAccessTokenExpired(loginToken.getAccessToken());

        //then
        assertThat(result).isFalse();
    }
}