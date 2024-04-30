package edu.skku.grabtable.user.domain.response;

import edu.skku.grabtable.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UserDetailResponse {
    private Long id;

    private String socialLoginId;

    private String profileImageUrl;

    private String username;

    private String email;

    private String phone;

    public static UserDetailResponse of(User user) {
        return new UserDetailResponse(user.getId(),
                user.getSocialLoginId(),
                user.getProfileImageUrl(),
                user.getUsername(),
                user.getEmail(),
                user.getPhone());
    }
}
