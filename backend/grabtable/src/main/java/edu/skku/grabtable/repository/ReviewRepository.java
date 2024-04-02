package edu.skku.grabtable.repository;

import edu.skku.grabtable.domain.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}
