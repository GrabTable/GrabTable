package edu.skku.grabtable.user.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.domain.response.UserDetailResponse;
import edu.skku.grabtable.user.service.UserService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MvcResult;

@WebMvcTest(UserController.class)
public class UserControllerTest extends ControllerTest {

    private final static String REFRESH_TOKEN = "refreshToken";
    private final static String ACCESS_TOKEN = "accessToken";

    @MockBean
    UserService userService;

    @Autowired
    ObjectMapper objectMapper;

//    @BeforeEach
//    void setUp() {
//        when(RefreshTokenRepository)
//    }

    @Test
    @DisplayName("자신의 정보를 조회 할 수 있다")
    void GetMeTest() throws Exception {
        //given
        User user = new User("username", "password", "email@gmail.com", "01012341234");
        UserDetailResponse userDetailResponse = UserDetailResponse.of(user);

        //when
        MvcResult result = mockMvc.perform(get("/v1/user/me"))
                .andDo(print())
                .andReturn();
        //then

        assertThat(result).usingRecursiveComparison().isEqualTo(userDetailResponse);
    }

    @Test
    @DisplayName("자신의 정보를 수정 할 수 있다")
    void ModifyMyInfo() throws Exception {

    }


}
