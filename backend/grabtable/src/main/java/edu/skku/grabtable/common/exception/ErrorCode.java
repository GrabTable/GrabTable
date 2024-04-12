package edu.skku.grabtable.common.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum ErrorCode {
    /**
     * 1XXX -> Common 에러
     */
    BAD_REQUEST(1000, "Bad Request", HttpStatus.BAD_REQUEST),
    NOT_FOUND(1001, "Contents Not Found", HttpStatus.NOT_FOUND),
    METHOD_NOT_ALLOWED(1002, "Method Not Allowed", HttpStatus.METHOD_NOT_ALLOWED),
    INTERNAL_SERVER_ERROR(1003, "Internal Server Error Occurred", HttpStatus.INTERNAL_SERVER_ERROR),
    METHOD_ARGUMENT_NOT_VALID(1004, "Method Argument Is Not Valid", HttpStatus.BAD_REQUEST),
    /**
     * 2XXX -> 인가 관련 에러
     */
    JWT_EMPTY(2000, "Access Token Is Empty", HttpStatus.UNAUTHORIZED),
    JWT_EXPIRED(2001, "Access Token Has Expired", HttpStatus.UNAUTHORIZED),
    INVALID_JWT_TOKEN(2002, "Access Token Is Invalid", HttpStatus.UNAUTHORIZED),
    INVALID_REFRESH_TOKEN(2003, "Refresh Token Is Invalid", HttpStatus.UNAUTHORIZED),
    INCORRECT_REFRESH_TOKEN(2004, "Refresh Token Mismatched With User's Refresh Token", HttpStatus.UNAUTHORIZED),
    INVALID_KAKAO_AUTH_TOKEN(2005, "Kakao Auth Token Is Invalid", HttpStatus.BAD_REQUEST),
    KAKAO_USER_NOT_FOUND(2006, "Kakao User Not Found", HttpStatus.BAD_REQUEST),
    /**
     * 3XXX -> User 관련 에러
     */
    USER_NOT_FOUND(3000, "User Not found", HttpStatus.NOT_FOUND),
    AUTH_PROVIDER_NOT_FOUND(3001, "Auth Provider Not Found", HttpStatus.INTERNAL_SERVER_ERROR),
    AUTH_PROVIDER_TYPE_INVALID(3002, "Auth Provider Type Is Invalid", HttpStatus.INTERNAL_SERVER_ERROR),
    /**
     * 4XXX -> Trip 관련 에러
     */
    TRIP_NOT_FOUND(4000, "Trip Not found", HttpStatus.NOT_FOUND),
    TRIP_USER_NOT_FOUND(4001, "Trip User Not found", HttpStatus.NOT_FOUND),
    TRIP_CURRENCY_NOT_FOUND(4002, "Trip Currency Not found", HttpStatus.NOT_FOUND),
    TRIP_ACCESS_UNAUTHORIZED(4003, "Trip Access Unauthorized", HttpStatus.UNAUTHORIZED),
    /**
     * 5XXX -> Expense 관련 에러
     */
    EXPENSE_NOT_FOUND(5000, "Expense Not found", HttpStatus.NOT_FOUND),
    USER_EXPENSE_NOT_FOUND(5001, "User Expense Not found", HttpStatus.NOT_FOUND);

    private final int code;
    private final String message;
    private final HttpStatus httpStatus;

    ErrorCode(int code, String message, HttpStatus httpStatus) {
        this.code = code;
        this.message = message;
        this.httpStatus = httpStatus;
    }
}