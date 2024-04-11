package edu.skku.grabtable.auth.service;

import edu.skku.grabtable.auth.domain.AuthToken;
import edu.skku.grabtable.auth.domain.RefreshToken;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.auth.domain.request.LoginRequest;
import edu.skku.grabtable.auth.domain.response.AccessTokenResponse;
import edu.skku.grabtable.auth.infrastructure.KakaoOAuthProvider;
import edu.skku.grabtable.auth.infrastructure.KakaoUserInfo;
import edu.skku.grabtable.auth.repository.RefreshTokenRepository;
import edu.skku.grabtable.common.exception.BusinessException;
import edu.skku.grabtable.common.exception.ErrorCode;
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
    private final TokenService tokenService;

    @Transactional
    public AccessTokenResponse login(LoginRequest loginRequest) {
        KakaoUserInfo userInfo = kakaoOAuthProvider.getUserInfo(loginRequest.getCode());

        User user = findOrCreateUser(
                userInfo.getSocialLoginId(),
                userInfo.getNickname(),
                userInfo.getProfileImageUrl()
        );

        UserTokens userTokens = jwtUtil.createLoginToken(user.getId().toString());
        RefreshToken refreshToken = new RefreshToken(user.getId(), userTokens.getRefreshToken());
        refreshTokenRepository.save(refreshToken);
        return new AccessTokenResponse(userTokens.getAccessToken());
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

    private UserTokens issueToken(User user) {
        AuthToken refreshToken = tokenService.createRefreshToken(user.getId());
        AuthToken accessToken = tokenService.createAccessToken(user.getId());
        refreshTokenRepository.save(new RefreshToken(user.getId(), refreshToken.getToken()));

        return new UserTokens(accessToken.getToken(), refreshToken.getToken());
    }


    // Refresh Token을 DB에서 제거
    public void logout(User user, String token) {
        refreshTokenRepository.deleteById(user.getId());
    }

    public User getUserByToken(String tokenStr) {
        AuthToken authToken = tokenService.convertToken(tokenStr);
        long userId = Long.parseLong(authToken.getClaims().getSubject());
        return userRepository.findById(userId)
                .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND));
    }


    //TODO
    public String reissueAccessToken(String refreshToken, String authHeader) {
        String accessToken = authHeader.split(" ")[1];
        log.info("parsed token={}", accessToken);

        //Access Token이 유효한 경우 -> 재반환 TODO

        //Access Token이 유효하지 않은 경우 -> Refresh Token 검사 후 재발급 TODO

        return accessToken;
    }
}
