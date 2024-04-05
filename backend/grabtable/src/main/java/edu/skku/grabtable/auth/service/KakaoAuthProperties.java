package edu.skku.grabtable.auth.service;


import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@AllArgsConstructor
@ConfigurationProperties(prefix = "spring.oauth.kakao")
public final class KakaoAuthProperties {
    private String adminKey;
}

