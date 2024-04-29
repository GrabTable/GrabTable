package edu.skku.grabtable.user.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.domain.request.UserUpdateRequest;
import edu.skku.grabtable.user.domain.response.UserDetailResponse;
import edu.skku.grabtable.user.service.UserService;
import jakarta.servlet.http.Cookie;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;

@WebMvcTest(value = UserController.class)
public class UserControllerTest extends ControllerTest {

    private final static String REFRESH_TOKEN = "refreshToken";
    private final static String ACCESS_TOKEN = "accessToken";

    @MockBean
    UserService userService;

    @Autowired
    ObjectMapper objectMapper;

    @Test
    @DisplayName("자신의 정보를 조회 할 수 있다")
    void GetMeTest() throws Exception {
        //given
        User user = new User("username", "password", "email@gmail.com");
        UserDetailResponse userDetailResponse = UserDetailResponse.of(user);

        when(authUserArgumentResolver.supportsParameter(any())).thenReturn(true);
        when(authUserArgumentResolver.resolveArgument(any(), any(), any(), any()))
                .thenReturn(user);

        //when
        MvcResult result = mockMvc.perform(get("/v1/user/me")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "access-token")
                        .cookie(new Cookie("refresh-token", "refresh-token")))
                .andDo(print())
                .andExpect(status().isOk())
                .andReturn();

        UserDetailResponse actual = objectMapper.readValue(
                result.getResponse().getContentAsString(),
                UserDetailResponse.class
        );
        //then
        Assertions.assertThat(actual).usingRecursiveComparison().isEqualTo(userDetailResponse);
    }

    @Test
    @DisplayName("자신의 정보를 수정 할 수 있다")
    void ModifyMyInfo() throws Exception {
        //given
        User user = new User("username", "password", "email@gmail.com");
        UserUpdateRequest userUpdateRequest = new UserUpdateRequest("url", "username", "email", "phone");

        //when
        mockMvc.perform(patch("/v1/user")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(userUpdateRequest)))
                .andExpect(status().isOk())
                .andReturn();

        //then
        verify(userService).modifyUser(any(), any());
    }


}
