package edu.skku.grabtable.common;

import edu.skku.grabtable.auth.AuthUserArgumentResolver;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.common.config.RestDocsConfiguration;
import edu.skku.grabtable.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.restdocs.RestDocumentationContextProvider;
import org.springframework.restdocs.RestDocumentationExtension;
import org.springframework.restdocs.mockmvc.MockMvcRestDocumentation;
import org.springframework.restdocs.mockmvc.RestDocumentationResultHandler;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;

@ExtendWith(RestDocumentationExtension.class)
@Import(RestDocsConfiguration.class)
public abstract class ControllerTest {

    @Autowired
    protected MockMvc mockMvc;

    @MockBean
    protected AuthUserArgumentResolver authUserArgumentResolver;

    @Autowired
    protected JwtUtil jwtUtil;

    @MockBean
    protected UserRepository userRepository;

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
}
