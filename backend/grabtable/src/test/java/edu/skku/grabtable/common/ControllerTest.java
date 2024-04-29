package edu.skku.grabtable.common;

import edu.skku.grabtable.auth.AuthUserArgumentResolver;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.common.config.RestDocsConfiguration;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.user.domain.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.core.MethodParameter;
import org.springframework.restdocs.RestDocumentationContextProvider;
import org.springframework.restdocs.RestDocumentationExtension;
import org.springframework.restdocs.mockmvc.MockMvcRestDocumentation;
import org.springframework.restdocs.mockmvc.RestDocumentationResultHandler;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.method.support.ModelAndViewContainer;

@ExtendWith(RestDocumentationExtension.class)
@Import(RestDocsConfiguration.class)
public abstract class ControllerTest {

    @Autowired
    protected MockMvc mockMvc;

    //    @MockBean
//    protected AuthUserArgumentResolver authUserArgumentResolver;
    @Autowired
    protected JwtUtil jwtUtil;

    @MockBean
    protected UserRepository userRepository;
    protected MockAuthArgumentResolver mockAuthArgumentResolver = new MockAuthArgumentResolver();

    @Autowired
    protected RestDocumentationResultHandler restDocs;

    @BeforeEach
    void setUp(WebApplicationContext context, RestDocumentationContextProvider restDoc) {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(context)
                .apply(MockMvcRestDocumentation.documentationConfiguration(restDoc))
                .alwaysDo(MockMvcResultHandlers.print())
                .alwaysDo(restDocs)
                .addFilter(new CharacterEncodingFilter("UTF-8", true))
                .build();
    }

    static class MockAuthArgumentResolver extends AuthUserArgumentResolver {


        public MockAuthArgumentResolver(UserRepository userRepository, JwtUtil jwtUtil) {
            super(userRepository, jwtUtil);
        }

        @Override
        public boolean supportsParameter(MethodParameter parameter) {
            return parameter.getParameterAnnotation(AuthUser.class) != null;
        }

        @Override
        public User resolveArgument(
                MethodParameter parameter,
                ModelAndViewContainer mavContainer,
                NativeWebRequest webRequest,
                WebDataBinderFactory binderFactory
        ) {
            return new User("username", "password", "email@gmail.com", "01012341234");

        }
    }

}
