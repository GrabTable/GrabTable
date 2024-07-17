package edu.skku.grabtable.review.repository;

import edu.skku.grabtable.review.domain.Review;
import edu.skku.grabtable.review.infrastructure.ReviewRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<Review, Long>, ReviewRepositoryCustom {
}
