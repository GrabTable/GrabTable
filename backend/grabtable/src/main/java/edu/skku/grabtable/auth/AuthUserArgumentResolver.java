package edu.skku.grabtable.auth;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.repository.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Arrays;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

@Component
@RequiredArgsConstructor
@Slf4j
public class AuthUserArgumentResolver implements HandlerMethodArgumentResolver {

    private final UserRepository userRepository;
    private final JwtUtil jwtUtil;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterAnnotation(AuthUser.class) != null;
    }

    @Override
    public Object resolveArgument(
            MethodParameter parameter,
            ModelAndViewContainer mavContainer,
            NativeWebRequest webRequest,
            WebDataBinderFactory binderFactory
    ) {
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();

        //refresh-token 추출
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            throw new RuntimeException("Refresh Token Cookie 없음");
        }

        String refreshToken = Arrays.stream(cookies)
                .filter(cookie -> cookie.getName().equals("refresh-token"))
                .findFirst()
                .orElseThrow(RuntimeException::new)
                .getValue();

        //access token 추출
        String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        String accessToken = authHeader.split(" ")[1];
        log.info("AuthUserArgumentResolver access token={}", accessToken);

        //검증
        boolean isAccessTokenValid = jwtUtil.validateAccessToken(accessToken);
        boolean isRefreshTokenValid = jwtUtil.validateRefreshToken(refreshToken);
        if (!isAccessTokenValid || !isRefreshTokenValid) {
            throw new RuntimeException("JWT 검증 실패");
        }

        //Access Token으로 정보 추출
        Long userId = Long.valueOf(jwtUtil.getSubject(accessToken));
        return userRepository.findById(userId);
    }
}