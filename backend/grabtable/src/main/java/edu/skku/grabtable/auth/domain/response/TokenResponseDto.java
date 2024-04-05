package edu.skku.grabtable.auth.domain.response;

public record TokenResponseDto(String accessToken, String refreshToken) {
}
