package edu.skku.grabtable.common.util;

import edu.skku.grabtable.common.exception.BusinessException;
import edu.skku.grabtable.common.exception.ErrorCode;
import jakarta.servlet.http.HttpServletRequest;

public class AuthHeaderParser {

    public static String parseTokenString(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            return authHeader.substring(7);
        } else {
            throw new BusinessException(ErrorCode.JWT_EMPTY);
        }
    }
}