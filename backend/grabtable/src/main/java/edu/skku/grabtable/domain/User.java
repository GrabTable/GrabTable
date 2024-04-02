package edu.skku.grabtable.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@Getter @Setter
@Table(name = "USERS")
public class User {

    @Id @GeneratedValue
    private Long id;

    private String username;

    private String password;

    private String email;

    private String phone;

    @OneToMany
    private List<Review> reviews;
}
