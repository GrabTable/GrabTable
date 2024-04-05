package edu.skku.grabtable.auth.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@AllArgsConstructor
@ConfigurationProperties(prefix = "spring.auth.jwt")
public class JwtProperties {
    private String secretKey;
    private String accessTokenExpiry;
    private String refreshTokenExpiry;
}
