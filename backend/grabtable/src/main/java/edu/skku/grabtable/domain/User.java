package edu.skku.grabtable.domain;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.review.domain.Review;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.ArrayList;
import java.util.List;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Table(name = "USERS")
public class User extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String socialLoginId;

    private String profileImageUrl;

    private String username;

    private String password;

    private String email;

    private String phone;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "cart", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Cart> carts = new ArrayList<>();

    @Builder
    public User(String username, String password, String email, String phone) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
    }

    public User(String socialLoginId, String nickname, String profileImageUrl) {
        this.socialLoginId = socialLoginId;
        this.username = nickname;
        this.profileImageUrl = profileImageUrl;
    }

    public User(Long id, String username, List<Review> reviews) {
        this.id = id;
        this.username = username;
        this.reviews = reviews;
    }
}
