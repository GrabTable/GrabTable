package edu.skku.grabtable.auth.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.auth.annotation.UserOnly;
import edu.skku.grabtable.auth.domain.request.LoginRequest;
import edu.skku.grabtable.auth.domain.response.AccessTokenResponse;
import edu.skku.grabtable.auth.service.LoginService;
import edu.skku.grabtable.domain.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/auth")
@RequiredArgsConstructor
@Slf4j
public class LoginController {

    private final LoginService loginService;

    @PostMapping(value = "/login/kakao")
    public ResponseEntity<AccessTokenResponse> kakaoLogin(
            @RequestBody LoginRequest loginRequest) {
        return ResponseEntity.ok(loginService.login(loginRequest));
    }


    @PostMapping("/reissue")
    public ResponseEntity<AccessTokenResponse> reissueToken(
            @CookieValue("refresh-token") String refreshToken,
            @RequestHeader("Authorization") String authHeader
    ) {
        String reissuedToken = loginService.reissueAccessToken(refreshToken, authHeader);
        return ResponseEntity.ok(new AccessTokenResponse(reissuedToken));
    }

    @DeleteMapping(value = "/logout")
    @UserOnly
    public ResponseEntity<Void> logout(
            @CookieValue("refresh-token") String token,
            @AuthUser User user
    ) {

        loginService.logout(user, token);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/login/test")
    public String test() {
        log.info("redirected");
        return "ok";
    }
}
