package edu.skku.grabtable.review.infrastructure;

import edu.skku.grabtable.review.domain.response.ReviewResponse;
import java.util.List;

public interface ReviewRepositoryCustom {

    List<ReviewResponse> findByUserIdBeforeCursor(Long userId, Long cursor, int size);

    List<ReviewResponse> findByStoreIdBeforeCursor(Long storeId, Long cursor, int size);
}
