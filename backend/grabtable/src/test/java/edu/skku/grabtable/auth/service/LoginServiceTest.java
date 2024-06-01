package edu.skku.grabtable.auth.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.doNothing;

import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.RefreshToken;
import edu.skku.grabtable.auth.repository.RefreshTokenRepository;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.common.exception.InvalidJwtException;
import java.util.Optional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class LoginServiceTest {

    @Mock
    JwtUtil jwtUtil;

    @Mock
    RefreshTokenRepository refreshTokenRepository;

    @InjectMocks
    LoginService loginService;

    @Test
    @DisplayName("재발급 요청 시 AccessToken이 유효하면 토큰을 그대로 돌려준다.")
    void reissue_if_validToken_then_return_as_it_is() {
        //given
        String refreshToken = "refreshToken";
        String accessToken = "accessToken";
        String authHeader = "Bearer " + accessToken;

        doNothing()
                .when(jwtUtil).validateRefreshToken(any());
        given(jwtUtil.isAccessTokenValid(any()))
                .willReturn(true);

        //when
        String actual = loginService.reissueAccessToken(refreshToken, authHeader);

        //then
        assertThat(actual).isEqualTo(accessToken);
    }

    @Test
    @DisplayName("재발급 요청 시 AccessToken이 만료 상태면 새로운 토큰을 반환한다.")
    void reissue_if_expiredToken_then_return_new() {
        //given
        String refreshToken = "refreshToken";
        String accessToken = "accessToken";
        String newAccessToken = "newAccessToken";
        RefreshToken token = new RefreshToken(1L, refreshToken);
        String authHeader = "Bearer " + accessToken;

        doNothing()
                .when(jwtUtil).validateRefreshToken(any());
        given(jwtUtil.isAccessTokenValid(any()))
                .willReturn(false);
        given(jwtUtil.isAccessTokenExpired(any()))
                .willReturn(true);
        given(refreshTokenRepository.findById(any()))
                .willReturn(Optional.of(token));
        given(jwtUtil.reissueAccessToken(any()))
                .willReturn(newAccessToken);

        //when
        String result = loginService.reissueAccessToken(refreshToken, authHeader);

        //then
        assertThat(result).isEqualTo(newAccessToken);
    }

    @Test
    @DisplayName("재발급 요청 시 위조된 AccessToken이면 InvalidJwtException 발생")
    void reissue_if_fakeToken_then_fail() {
        //given
        String refreshToken = "refreshToken";
        String authHeader = "Bearer FAKE";

        doNothing()
                .when(jwtUtil).validateRefreshToken(any());
        given(jwtUtil.isAccessTokenValid(any()))
                .willReturn(false);
        given(jwtUtil.isAccessTokenExpired(any()))
                .willReturn(false);

        //when & then
        assertThatThrownBy(() -> loginService.reissueAccessToken(refreshToken, authHeader))
                .isInstanceOf(InvalidJwtException.class)
                .hasMessageContaining(ExceptionCode.FAILED_TO_VALIDATE_TOKEN.getMessage());
    }

    @Test
    @DisplayName("재발급 요청 시 RefreshToken이 DB에 존재하지 않으면 InvalidJwtException 발생")
    void reissue_if_noRefreshToken_then_fail() {
        //given
        String refreshToken = "oldToken";
        String accessToken = "accessToken";
        String authHeader = "Bearer " + accessToken;

        doNothing()
                .when(jwtUtil).validateRefreshToken(any());
        given(jwtUtil.isAccessTokenValid(any()))
                .willReturn(false);
        given(jwtUtil.isAccessTokenExpired(any()))
                .willReturn(true);
        given(refreshTokenRepository.findById(any()))
                .willReturn(Optional.empty());

        //when & then
        assertThatThrownBy(() -> loginService.reissueAccessToken(refreshToken, authHeader))
                .isInstanceOf(InvalidJwtException.class)
                .hasMessageContaining(ExceptionCode.INVALID_REFRESH_TOKEN.getMessage());
    }
}