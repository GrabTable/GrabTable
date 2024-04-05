package edu.skku.grabtable.auth.domain;

import edu.skku.grabtable.common.exception.BusinessException;
import edu.skku.grabtable.common.exception.ErrorCode;
import io.jsonwebtoken.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.security.Key;
import java.security.SignatureException;
import java.util.Date;

@Slf4j
@Getter
@RequiredArgsConstructor
public class AuthToken {

    private final String token;
    private final Claims claims;

    public AuthToken(long id, long expiry, Key key){
        this.token = createToken(id, expiry, key);
        this.claims = getTokenClaims(token, key);
        validate();
    }

    public AuthToken(String token, Key key) {
        this.token = token;
        this.claims = getTokenClaims(token, key);
    }
    private String createToken(long id, long expiry, Key key) {
        return Jwts.builder()
                .setSubject(String.valueOf(id))
                .setExpiration(new Date(System.currentTimeMillis() + expiry))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    private Claims getTokenClaims(String token, Key key) {
        try {
            return Jwts.parserBuilder()
                    .setSigningKey(key)
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
        } catch (SecurityException e) {
            log.info("Invalid JWT Signature");
            throw new BusinessException(ErrorCode.INVALID_JWT_TOKEN);
        } catch (MalformedJwtException e) {
            log.info("Invalid JWT token.");
            throw new BusinessException(ErrorCode.INVALID_JWT_TOKEN);
        } catch (ExpiredJwtException e) {
            log.info("Expired JWT token.");
            throw new BusinessException(ErrorCode.JWT_EXPIRED);
        } catch (UnsupportedJwtException e) {
            log.info("Unsupported JWT token.");
            throw new BusinessException(ErrorCode.INVALID_JWT_TOKEN);
        } catch (IllegalArgumentException e) {
            log.info("JWT token compact of handler are invalid.");
            throw new BusinessException(ErrorCode.INVALID_JWT_TOKEN);
        }
    }

    private void validate() {
        if (claims == null) {
            throw new BusinessException(ErrorCode.INVALID_JWT_TOKEN);
        }
    }
}
