package edu.skku.grabtable.user.domain.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UserUpdateRequest {

    @NotBlank
    private String profileImageUrl;

    @NotBlank
    private String username;

    @NotEmpty
    private String email;

    @NotEmpty
    private String phone;
}
