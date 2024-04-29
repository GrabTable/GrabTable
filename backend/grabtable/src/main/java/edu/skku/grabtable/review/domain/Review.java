package edu.skku.grabtable.review.domain;

import edu.skku.grabtable.common.domain.BaseTimeEntity;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.user.domain.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString(of = {"reviewPlatform", "message", "rating", "status"})
@SQLDelete(sql = "UPDATE review SET status = 'INVALID' WHERE id = ?")
@SQLRestriction("status = 'VALID'")
public class Review extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Enumerated(EnumType.STRING)
    private ReviewPlatform reviewPlatform;

    @Column(length = 1000)
    private String message;

    private Double rating;

    @Enumerated(EnumType.STRING)
    private ReviewStatus status;

    public static Review of(Store store, User user, String message, Double rating) {
        Review review = new Review();
        review.store = store;
        review.user = user;
        review.message = message;
        review.rating = rating;
        review.reviewPlatform = ReviewPlatform.GRABTABLE;
        review.status = ReviewStatus.VALID;

        return review;
    }

    public void update(String message, Double rating) {
        this.message = message;
        this.rating = rating;
    }
}
