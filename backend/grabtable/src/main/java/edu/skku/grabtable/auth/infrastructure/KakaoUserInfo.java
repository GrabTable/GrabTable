package edu.skku.grabtable.auth.infrastructure;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.ToString;

@ToString
public class KakaoUserInfo {

    @Getter
    @JsonProperty("id")
    private String socialLoginId;

    @JsonProperty("kakao_account")
    private KakaoAccount kakaoAccount;

    public String getNickname() {
        return kakaoAccount.kakaoProfile.nickname;
    }

    public String getProfileImageUrl() {
        return kakaoAccount.kakaoProfile.profileImageUrl;
    }

    private static class KakaoAccount {
        @JsonProperty("profile")
        private KakaoProfile kakaoProfile;
    }

    private static class KakaoProfile {
        @JsonProperty("nickname")
        private String nickname;
        @JsonProperty("profile_image_url")
        private String profileImageUrl;
    }
}
