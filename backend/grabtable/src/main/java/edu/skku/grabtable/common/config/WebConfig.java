package edu.skku.grabtable.common.config;

import edu.skku.grabtable.auth.AuthUserArgumentResolver;
import edu.skku.grabtable.common.converter.OrderStatusConverter;
import edu.skku.grabtable.common.interceptor.QueryLoggingInterceptor;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@RequiredArgsConstructor
@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final AuthUserArgumentResolver authUserArgumentResolver;
    private final QueryLoggingInterceptor queryLoggingInterceptor;

    @Override
    public void addCorsMappings(CorsRegistry corsRegistry) {
        corsRegistry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowedMethods("*")
                .allowedHeaders("*")
                .allowCredentials(true);
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(authUserArgumentResolver);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(queryLoggingInterceptor)
                .excludePathPatterns("/css/**", "/images/**", "/js/**");
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new OrderStatusConverter());
    }
}
