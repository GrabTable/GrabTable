package edu.skku.grabtable.auth;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;

import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.common.exception.InvalidJwtException;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpHeaders;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@ExtendWith(MockitoExtension.class)
class AuthUserArgumentResolverTest {

    @Mock
    private MethodParameter parameter;

    @Mock
    private NativeWebRequest request;

    private MockHttpServletRequest mockHttpServletRequest;

    @Mock
    UserRepository userRepository;

    @Mock
    JwtUtil jwtUtil;

    @InjectMocks
    AuthUserArgumentResolver resolver;

    @BeforeEach
    void setUp() {
        mockHttpServletRequest = new MockHttpServletRequest();
        RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(mockHttpServletRequest));
    }

    @Test
    @DisplayName("JWT 토큰으로 User를 인자에 주입할 수 있다.")
    void injectUserInfo() {
        //given
        Cookie[] cookies = {new Cookie("refresh-token", "RT")};
        String accessToken = "Bearer TOKEN";
        User user = new User(1L, "userA", new ArrayList<>());

        given(request.getNativeRequest(HttpServletRequest.class))
                .willReturn(mockHttpServletRequest);

        mockHttpServletRequest.setCookies(cookies);
        mockHttpServletRequest.addHeader(HttpHeaders.AUTHORIZATION, accessToken);

        given(jwtUtil.isAccessTokenValid(any()))
                .willReturn(true);
        given(jwtUtil.getSubject(any()))
                .willReturn("1");
        given(userRepository.findById(any()))
                .willReturn(Optional.of(user));

        //when
        User actual = resolver.resolveArgument(parameter, null, request, null);

        //then
        assertThat(actual).usingRecursiveComparison().isEqualTo(user);
    }

    @Test
    @DisplayName("쿠키에 RefreshToken이 없으면 InvalidJwtException 발생")
    void injectUserInfo_noRefreshToken() {
        //given
        Cookie[] cookies = {};

        given(request.getNativeRequest(HttpServletRequest.class))
                .willReturn(mockHttpServletRequest);

        mockHttpServletRequest.setCookies(cookies);

        //when & then
        assertThatThrownBy(() -> resolver.resolveArgument(parameter, null, request, null))
                .isInstanceOf(InvalidJwtException.class)
                .hasMessageContaining(ExceptionCode.INVALID_REFRESH_TOKEN.getMessage());
    }

    @Test
    @DisplayName("헤더에 AccessToken이 없으면 InvalidJwtException 발생")
    void injectUserInfo_noAccessToken() {
        //given
        Cookie[] cookies = {new Cookie("refresh-token", "RT")};

        given(request.getNativeRequest(HttpServletRequest.class))
                .willReturn(mockHttpServletRequest);

        mockHttpServletRequest.setCookies(cookies);

        //when & then
        assertThatThrownBy(() -> resolver.resolveArgument(parameter, null, request, null))
                .isInstanceOf(InvalidJwtException.class)
                .hasMessageContaining(ExceptionCode.INVALID_ACCESS_TOKEN.getMessage());
    }

    @Test
    @DisplayName("AccessToken이 유효하지 않으면 InvalidJwtException 발생")
    void injectUserInfo_notValidAccessToken() {
        //given
        Cookie[] cookies = {new Cookie("refresh-token", "RT")};
        String accessToken = "Bearer TOKEN";

        given(request.getNativeRequest(HttpServletRequest.class))
                .willReturn(mockHttpServletRequest);

        mockHttpServletRequest.setCookies(cookies);
        mockHttpServletRequest.addHeader(HttpHeaders.AUTHORIZATION, accessToken);

        given(jwtUtil.isAccessTokenValid(any()))
                .willReturn(false);

        //when & then
        assertThatThrownBy(() -> resolver.resolveArgument(parameter, null, request, null))
                .isInstanceOf(InvalidJwtException.class)
                .hasMessageContaining(ExceptionCode.FAILED_TO_VALIDATE_TOKEN.getMessage());
    }


}