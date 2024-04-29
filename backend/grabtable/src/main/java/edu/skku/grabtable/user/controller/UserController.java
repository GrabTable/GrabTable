package edu.skku.grabtable.user.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.domain.request.UserUpdateRequest;
import edu.skku.grabtable.user.domain.response.UserDetailResponse;
import edu.skku.grabtable.user.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("v1/user")
@RestController
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/me")
    UserDetailResponse getMe(@AuthUser User user) {
        return UserDetailResponse.of(user);
    }

    @PatchMapping()
    ResponseEntity<Void> modifyUser(@AuthUser User user, @Valid UserUpdateRequest userRequest) {
        userService.modifyUser(user, userRequest);
        return ResponseEntity.ok().build();
    }
}
