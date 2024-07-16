package edu.skku.grabtable.review.infrastructure;

import static edu.skku.grabtable.review.domain.QReview.review;
import static edu.skku.grabtable.store.domain.QStore.store;
import static edu.skku.grabtable.user.domain.QUser.user;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import edu.skku.grabtable.common.domain.response.SliceResponse;
import edu.skku.grabtable.review.domain.response.ReviewResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ReviewRepositoryImpl implements ReviewRepositoryCustom {

    private final JPAQueryFactory jpaQueryFactory;

    @Override
    public SliceResponse<ReviewResponse> findByStoreIdBeforeCursor(Long storeId, Long cursor, int size) {
        List<ReviewResponse> reviewResponses = jpaQueryFactory.select(Projections.constructor(
                        ReviewResponse.class,
                        review.id,
                        user.username,
                        store.storeName,
                        review.reviewPlatform,
                        review.message,
                        review.rating)
                ).from(review)
                .innerJoin(review.store, store)
                .innerJoin(review.user, user)
                .where(review.store.id.eq(storeId), isInSearchRange(cursor))
                .orderBy(review.id.desc())
                .limit(size + 1)
                .fetch();

        boolean hasNext = existsNextPage(reviewResponses, size);

        Long nextCursor = null;
        if (hasNext) {
            reviewResponses.remove(reviewResponses.size() - 1);
            nextCursor = reviewResponses.get(reviewResponses.size() - 1).getId();
        }

        return SliceResponse.of(reviewResponses, hasNext, nextCursor);
    }

    @Override
    public SliceResponse<ReviewResponse> findByUserIdBeforeCursor(Long userId, Long cursor, int size) {
        List<ReviewResponse> reviewResponses = jpaQueryFactory.select(Projections.constructor(
                        ReviewResponse.class,
                        review.id,
                        user.username,
                        store.storeName,
                        review.reviewPlatform,
                        review.message,
                        review.rating)
                ).from(review)
                .innerJoin(review.store, store)
                .innerJoin(review.user, user)
                .where(review.user.id.eq(userId), isInSearchRange(cursor))
                .orderBy(review.id.desc())
                .limit(size + 1)
                .fetch();

        boolean hasNext = existsNextPage(reviewResponses, size);

        Long nextCursor = null;
        if (hasNext) {
            reviewResponses.remove(reviewResponses.size() - 1);
            nextCursor = reviewResponses.get(reviewResponses.size() - 1).getId();
        }

        return SliceResponse.of(reviewResponses, hasNext, nextCursor);
    }

    private BooleanExpression isInSearchRange(Long cursor) {
        if (cursor == null) {
            return null;
        }

        return review.id.lt(cursor);
    }

    private boolean existsNextPage(List<ReviewResponse> reviewResponses, int size) {
        return reviewResponses.size() > size;
    }

}
