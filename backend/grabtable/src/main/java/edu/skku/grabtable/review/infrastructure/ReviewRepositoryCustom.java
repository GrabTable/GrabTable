package edu.skku.grabtable.review.infrastructure;

import edu.skku.grabtable.common.domain.response.SliceResponse;
import edu.skku.grabtable.review.domain.response.ReviewResponse;

public interface ReviewRepositoryCustom {

    SliceResponse<ReviewResponse> findByUserIdBeforeCursor(Long userId, Long cursor, int size);

    SliceResponse<ReviewResponse> findByStoreIdBeforeCursor(Long storeId, Long cursor, int size);
}
