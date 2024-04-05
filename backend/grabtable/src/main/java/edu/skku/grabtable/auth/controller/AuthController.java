package edu.skku.grabtable.auth.controller;

import edu.skku.grabtable.common.annotation.AuthUser;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.auth.service.AuthService;
import edu.skku.grabtable.auth.domain.request.KakaoLoginRequestDto;
import edu.skku.grabtable.auth.domain.response.TokenResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping(value = "/login/kakao")
    public ResponseEntity<TokenResponseDto> kakaoLogin(@RequestBody KakaoLoginRequestDto kakaoLoginRequest){
        return ResponseEntity.ok(authService.login(kakaoLoginRequest));
    }

    @DeleteMapping(value = "/logout")
    public ResponseEntity<Void> logout(@AuthUser User user) {
        authService.logout(user);
        return ResponseEntity.noContent().build();
    }
}
