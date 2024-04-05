package edu.skku.grabtable.auth.service;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@ConfigurationProperties(prefix = "spring.auth.jwt")
public record JwtProperties(String secretKey, String accessTokenExpiry, String refreshTokenExpiry) {
}
