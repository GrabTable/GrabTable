package edu.skku.grabtable.common.exception;

import lombok.Getter;

@Getter
public class InternalServerException extends RuntimeException {
    private final int code;
    private final String message;

    public InternalServerException(ExceptionCode exceptionCode) {
        this.code = exceptionCode.getCode();
        this.message = exceptionCode.getMessage();
    }
}
