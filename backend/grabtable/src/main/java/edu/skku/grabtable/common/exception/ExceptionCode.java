package edu.skku.grabtable.common.exception;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum ExceptionCode {
    INVALID_REQUEST(1000, "유효하지 않은 요청입니다."),
    NOT_FOUND_REVIEW_ID(1001, "요청 ID에 해당하는 리뷰가 존재하지 않습니다."),
    NOT_FOUND_USER_ID(1002, "요청 ID에 해당하는 유저가 존재하지 않습니다."),
    NOT_FOUND_STORE_ID(1003, "요청 ID에 해당하는 상점이 존재하지 않습니다."),
    NOT_FOUND_RESERVATION_ID(1004, "요청 ID에 해당하는 예약이 존재하지 않습니다."),
    NOT_FOUND_MENU_ID(1005, "요청 ID에 해당하는 메뉴가 존재하지 않습니다."),
    NOT_FOUND_CART_ID(1006, "요청 ID에 해당하는 장바구니 상품이 존재하지 않습니다."),

    UNABLE_TO_GET_USER_INFO(2001, "소셜 로그인 공급자로부터 유저 정보를 받아올 수 없습니다."),
    UNABLE_TO_GET_ACCESS_TOKEN(2002, "소셜 로그인 공급자로부터 인증 토큰을 받아올 수 없습니다."),

    UNAUTHORIZED_ACCESS(3000, "접근할 수 없는 리소스입니다."),
    INVALID_REFRESH_TOKEN(3001, "유효하지 않은 Refresh Token입니다."),
    FAILED_TO_VALIDATE_TOKEN(3002, "토큰 검증에 실패했습니다."),

    ALREADY_HOSTING_USER(4001, "이미 예약을 생성한 유저입니다."),
    ALREADY_INVITED_USER(4002, "이미 예약에 초대된 유저입니다."),
    NO_RESERVATION_USER(4003, "현재 진행 중인 예약이 존재하지 않는 유저입니다."),
    ALREADY_EXISTING_CART(4004, "사용자의 장바구니에 이미 존재하는 메뉴입니다."),

    CUREENT_CARTS_EMPTY(5001, "사용자의 장바구니가 비어 있습니다."),
    FAILED_TO_VALIDATE_PAYMENT(5002, "결제 검증에 실패했습니다."),
    NOT_ENOUGH_ORDER(5003, "미결제 인원이 존재하여 예약을 확정할 수 없습니다.");

    private final int code;
    private final String message;
}
