package edu.skku.grabtable.review.repository;

import edu.skku.grabtable.review.domain.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}
