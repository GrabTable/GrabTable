package edu.skku.grabtable.common.exception;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum ExceptionCode {
    INVALID_REQUEST(1000, "유효하지 않은 요청입니다."),
    NOT_FOUND_REVIEW_ID(1001, "요청 ID에 해당하는 리뷰가 존재하지 않습니다."),
    NOT_FOUND_USER_ID(1002, "요청 ID에 해당하는 유저가 존재하지 않습니다."),
    NOT_FOUND_STORE_ID(1003, "요청 ID에 해당하는 상점이 존재하지 않습니다.");

    private final int code;
    private final String message;
}
