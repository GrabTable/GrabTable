package edu.skku.grabtable.common.interceptor;

import edu.skku.grabtable.common.inspector.QueryCountInspector;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
@Slf4j
@RequiredArgsConstructor
public class QueryLoggingInterceptor implements HandlerInterceptor {

    private static final int WARNING_THRESHOLD = 5;

    private final QueryCountInspector queryCountInspector;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        queryCountInspector.startCounter();
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        Long queryCount = queryCountInspector.getCount();
        double time = getQueryElapsedSeconds();

        log.info("상태코드: {}, 메소드: {}, URI: {}, 쿼리 횟수: {}, 경과 시간: {}초",
                response.getStatus(),
                request.getMethod(),
                request.getRequestURI(),
                queryCount,
                time);

        if (queryCount >= WARNING_THRESHOLD) {
            log.warn("쿼리 횟수 {}회 초과 : {}", WARNING_THRESHOLD, queryCount);
        }

        queryCountInspector.clearCounter();
    }

    private double getQueryElapsedSeconds() {
        return (System.currentTimeMillis() - queryCountInspector.getTimeStamp()) / 1000.0;
    }
}
