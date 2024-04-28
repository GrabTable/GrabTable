package edu.skku.grabtable.reservation.domain.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UserInfoResponse {
    private Long id;
    private String username;
    private String profileImageUrl;
}
