package edu.skku.grabtable.auth.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class RefreshToken {
    @Id
    private Long userId;

    private String value;

    public RefreshToken(Long userId, String value) {
        this.userId = userId;
        this.value = value;
    }
}
