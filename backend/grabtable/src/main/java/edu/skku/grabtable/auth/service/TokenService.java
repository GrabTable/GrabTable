package edu.skku.grabtable.auth.service;

import edu.skku.grabtable.auth.domain.AuthToken;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.security.Key;

@RequiredArgsConstructor
@Component
public class TokenService {

    private final JwtProperties jwtProperties;

    public AuthToken createAccessToken(long id) {
        return new AuthToken(id,
                Long.parseLong(jwtProperties.accessTokenExpiry()),
                generateShaKey(jwtProperties.secretKey()));
    }

    public AuthToken createRefreshToken(long id) {
        return new AuthToken(id,
                Long.parseLong(jwtProperties.refreshTokenExpiry()),
                generateShaKey(jwtProperties.secretKey()));
    }

    public AuthToken convertToken(String token) {
        return new AuthToken(token, generateShaKey(jwtProperties.secretKey()));
    }

    private Key generateShaKey(String secretKey) {
        return Keys.hmacShaKeyFor(secretKey.getBytes());
    }
}
