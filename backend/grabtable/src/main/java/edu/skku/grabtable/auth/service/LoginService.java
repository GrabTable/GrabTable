package edu.skku.grabtable.auth.service;

import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.RefreshToken;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.auth.domain.request.LoginRequest;
import edu.skku.grabtable.auth.infrastructure.KakaoOAuthProvider;
import edu.skku.grabtable.auth.infrastructure.KakaoUserInfo;
import edu.skku.grabtable.auth.repository.RefreshTokenRepository;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.common.exception.InvalidJwtException;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@Transactional
@RequiredArgsConstructor
public class LoginService {
    private final RefreshTokenRepository refreshTokenRepository;
    private final UserRepository userRepository;
    private final JwtUtil jwtUtil;
    private final KakaoOAuthProvider kakaoOAuthProvider;

    public UserTokens login(LoginRequest loginRequest) {
        KakaoUserInfo userInfo = kakaoOAuthProvider.getUserInfo(loginRequest.getCode());

        User user = findOrCreateUser(
                userInfo.getSocialLoginId(),
                userInfo.getNickname(),
                userInfo.getProfileImageUrl()
        );

        UserTokens userTokens = jwtUtil.createLoginToken(user.getId().toString());
        RefreshToken refreshToken = new RefreshToken(user.getId(), userTokens.getRefreshToken());
        refreshTokenRepository.save(refreshToken);
        return userTokens;
    }

    private User findOrCreateUser(String socialLoginId, String nickname, String profileImageUrl) {
        return userRepository.findBySocialLoginId(socialLoginId)
                .orElseGet(() -> createUser(socialLoginId, nickname, profileImageUrl));
    }

    private User createUser(String socialLoginId, String nickname, String profileImageUrl) {
        String newNickname = generateNewUserNickname(socialLoginId, nickname);
        log.info("new nickname={}", newNickname);
        return userRepository.save(new User(socialLoginId, newNickname, profileImageUrl));
    }

    private String generateNewUserNickname(String socialLoginId, String nickname) {
        return nickname + "#" + socialLoginId;
    }


    // Refresh Token을 DB에서 제거
    public void logout(User user) {
        refreshTokenRepository.deleteById(user.getId());
    }

    //TODO
    public String reissueAccessToken(String refreshToken, String authHeader) {
        //Bearer 제거
        String accessToken = authHeader.split(" ")[1];

        //토큰 만료, 비밀키 무결성 검사
        jwtUtil.validateRefreshToken(refreshToken);

        //Access Token이 유효한 경우 -> 재반환
        if (jwtUtil.isAccessTokenValid(accessToken)) {
            return accessToken;
        }

        //Access Token이 만료된 경우 -> Refresh Token DB 검증 후 재발급
        if (jwtUtil.isAccessTokenExpired(accessToken)) {
            RefreshToken foundRefreshToken = refreshTokenRepository.findByValue(refreshToken)
                    .orElseThrow(() -> new InvalidJwtException(ExceptionCode.INVALID_REFRESH_TOKEN));
            return jwtUtil.reissueAccessToken(foundRefreshToken.getUserId().toString());
        }

        throw new InvalidJwtException(ExceptionCode.FAILED_TO_VALIDATE_TOKEN);
    }
}
