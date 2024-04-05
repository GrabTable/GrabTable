package edu.skku.grabtable.auth.service;

import edu.skku.grabtable.auth.domain.AuthProvider;
import edu.skku.grabtable.auth.domain.AuthProviderType;
import edu.skku.grabtable.auth.domain.AuthToken;
import edu.skku.grabtable.auth.domain.RefreshToken;
import edu.skku.grabtable.common.exception.BusinessException;
import edu.skku.grabtable.common.exception.ErrorCode;
import edu.skku.grabtable.domain.*;
import edu.skku.grabtable.auth.domain.request.KakaoLoginRequestDto;
import edu.skku.grabtable.auth.domain.response.TokenResponseDto;
import edu.skku.grabtable.auth.repository.AuthProviderRepository;
import edu.skku.grabtable.auth.repository.RefreshTokenRepository;
import edu.skku.grabtable.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final AuthProviderRepository authProviderRepository;
    private final RefreshTokenRepository refreshTokenRepository;
    private final UserRepository userRepository;
    private final KakaoAuthService kakaoAuthService;

    private final TokenService tokenService;

    @Transactional
    public TokenResponseDto login(KakaoLoginRequestDto kakaoLoginRequest) {
        String accessToken = kakaoAuthService.getAccessToken(kakaoLoginRequest.oauthToken());
        String socialLoginId = kakaoAuthService.getSocialLoginId(accessToken);
        AuthProvider authProvider = getOrCreateAuthProvider(socialLoginId, AuthProviderType.KAKAO);
        authProviderRepository.save(authProvider);
        return issueToken(authProvider.getUser());
    }

    private AuthProvider getOrCreateAuthProvider(String socialLoginId, AuthProviderType authProviderType) {
        AuthProvider authProvider = authProviderRepository.findBySocialLoginId(socialLoginId)
                .orElse(new AuthProvider(socialLoginId, authProviderType));

        if (authProvider.getUser() == null) {
            User user = new User(authProvider);
            userRepository.save(user);
        }
        return authProvider;
    }

    private TokenResponseDto issueToken(User user) {
        AuthToken refreshToken = tokenService.createRefreshToken(user.getId());
        AuthToken accessToken = tokenService.createAccessToken(user.getId());
        refreshTokenRepository.save(new RefreshToken(user.getId(), refreshToken.getToken()));

        return new TokenResponseDto(accessToken.getToken(), refreshToken.getToken());
    }


    public void logout(User user) {
        Optional<RefreshToken> optionalRefreshToken = refreshTokenRepository.findById(user.getId());
        optionalRefreshToken.ifPresent(refreshTokenRepository::delete);
    }

    public User getUserByToken(String tokenStr) {
        AuthToken authToken = tokenService.convertToken(tokenStr);
        long userId = Long.parseLong(authToken.getClaims().getSubject());
        return userRepository.findById(userId)
                .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND));
    }
}
