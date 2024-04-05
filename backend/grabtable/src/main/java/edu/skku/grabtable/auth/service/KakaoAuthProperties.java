package edu.skku.grabtable.auth.service;


import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "spring.oauth.kakao")
public record KakaoAuthProperties(String adminKey) {}

