package edu.skku.grabtable.auth.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.auth.domain.request.LoginRequest;
import edu.skku.grabtable.auth.domain.response.AccessTokenResponse;
import edu.skku.grabtable.auth.service.LoginService;
import edu.skku.grabtable.user.domain.User;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/auth")
@RequiredArgsConstructor
@Slf4j
public class LoginController {

    private static final int ONE_WEEK_SECONDS = 604800;

    private final LoginService loginService;

    @PostMapping(value = "/login/kakao")
    public ResponseEntity<AccessTokenResponse> kakaoLogin(
            @RequestBody LoginRequest loginRequest,
            HttpServletResponse response
    ) {
        UserTokens userTokens = loginService.login(loginRequest);

        ResponseCookie cookie = ResponseCookie.from("refresh-token", userTokens.getRefreshToken())
                .maxAge(ONE_WEEK_SECONDS)
//                .secure(true)
                .httpOnly(true)
                .path("/")
                .build();

        response.addHeader(HttpHeaders.SET_COOKIE, cookie.toString());
        return ResponseEntity.ok(new AccessTokenResponse(userTokens.getAccessToken()));
    }


    @PostMapping("/reissue")
    public ResponseEntity<AccessTokenResponse> reissueToken(
            @CookieValue("refresh-token") String refreshToken,
            @RequestHeader("Authorization") String authHeader
    ) {
        String reissuedToken = loginService.reissueAccessToken(refreshToken, authHeader);
        return ResponseEntity.ok(new AccessTokenResponse(reissuedToken));
    }

    @PostMapping(value = "/logout")
    public ResponseEntity<Void> logout(
            @AuthUser User user
    ) {

        loginService.logout(user);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/login/test")
    public String test(@RequestParam String code) {
        log.info("code={}", code);
        return "ok";
    }
}
