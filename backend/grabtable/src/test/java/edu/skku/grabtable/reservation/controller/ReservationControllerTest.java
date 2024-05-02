package edu.skku.grabtable.reservation.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.payload.PayloadDocumentation.fieldWithPath;
import static org.springframework.restdocs.payload.PayloadDocumentation.requestFields;
import static org.springframework.restdocs.payload.PayloadDocumentation.responseFields;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.reservation.domain.request.ReservationRequest;
import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import edu.skku.grabtable.reservation.service.ReservationService;
import jakarta.servlet.http.Cookie;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.restdocs.payload.JsonFieldType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

@WebMvcTest(ReservationController.class)
@AutoConfigureRestDocs
class ReservationControllerTest extends ControllerTest {

    private static final UserTokens USER_TOKENS = new UserTokens("refreshToken", "accessToken");
    private static final Cookie COOKIE = new Cookie("refresh-token", USER_TOKENS.getRefreshToken());

    @MockBean
    ReservationService reservationService;

    @Autowired
    ObjectMapper objectMapper;

    @Test
    @DisplayName("신규 예약을 생성할 수 있다.")
    void create() throws Exception {
        //given
        doNothing().when(reservationService).createNewReservation(any(), any());
        ReservationRequest reservationRequest = new ReservationRequest(1L);

        //when
        ResultActions resultActions = mockMvc.perform(post("/v1/reservations")
                        .header(HttpHeaders.AUTHORIZATION, USER_TOKENS.getAccessToken())
                        .cookie(COOKIE)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(reservationRequest)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isCreated());

        resultActions.andDo(
                restDocs.document(
                        requestFields(
                                fieldWithPath("storeId")
                                        .type(JsonFieldType.NUMBER)
                                        .description("가게 ID")
                        )
                )
        );

        //then
        Mockito.verify(reservationService).createNewReservation(any(), any());
    }

    @Test
    @DisplayName("기존 예약에 참여할 수 있다.")
    void join() throws Exception {
        //given
        doNothing().when(reservationService).joinExistingReservation(any(), any());
        final String inviteCode = "invite-code";

        //when
        mockMvc.perform(post("/v1/reservations/{inviteCode}", inviteCode)
                        .header(HttpHeaders.AUTHORIZATION, USER_TOKENS.getAccessToken())
                        .cookie(COOKIE)
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isCreated());

        //then
        Mockito.verify(reservationService).joinExistingReservation(any(), any());
    }

    @Test
    @DisplayName("유저의 현재 예약을 조회할 수 있다.")
    void me() throws Exception {
        //given
        ReservationDetailResponse response = new ReservationDetailResponse(1L, 1L, null, null,
                "invite-code", null, null);
        when(reservationService.findReservationByUser(any()))
                .thenReturn(response);

        //when
        ResultActions resultActions = mockMvc.perform(get("/v1/reservations/me")
                        .header(HttpHeaders.AUTHORIZATION, USER_TOKENS.getAccessToken())
                        .cookie(COOKIE)
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk());

        MvcResult mvcResult = resultActions.andDo(
                restDocs.document(
                        responseFields(
                                fieldWithPath("id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("예약 ID"),
                                fieldWithPath("storeId")
                                        .type(JsonFieldType.NUMBER)
                                        .description("가게 ID"),
                                fieldWithPath("host")
                                        .type(JsonFieldType.NULL)
                                        .description("호스트 정보"),
                                fieldWithPath("invitees")
                                        .type(JsonFieldType.NULL)
                                        .description("참여자들 정보"),
                                fieldWithPath("inviteCode")
                                        .type(JsonFieldType.STRING)
                                        .description("초대 코드"),
                                fieldWithPath("sharedOrder")
                                        .type(JsonFieldType.NULL)
                                        .description("공유 주문 정보"),
                                fieldWithPath("orders")
                                        .type(JsonFieldType.NULL)
                                        .description("개인별 주문 정보")
                        )
                )
        ).andReturn();

        //then
        ReservationDetailResponse actual = objectMapper.readValue(
                mvcResult.getResponse().getContentAsString(),
                ReservationDetailResponse.class
        );

        assertThat(response).usingRecursiveComparison().isEqualTo(actual);
    }

    @Test
    @DisplayName("호스트인 유저는 현재 예약을 확정할 수 있다.")
    void confirm() throws Exception {
        //given
        doNothing().when(reservationService).confirmCurrentReservation(any());

        //when
        mockMvc.perform(post("/v1/reservations/confirm")
                        .header(HttpHeaders.AUTHORIZATION, USER_TOKENS.getAccessToken())
                        .cookie(COOKIE)
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isCreated())
                .andReturn();

        //then
        Mockito.verify(reservationService).confirmCurrentReservation(any());
    }

    @Test
    @DisplayName("유저는 현재 예약을 취소할 수 있다.")
    void cancel() throws Exception {
        //given
        doNothing().when(reservationService).cancel(any());

        //when
        mockMvc.perform(delete("/v1/reservations")
                        .header(HttpHeaders.AUTHORIZATION, USER_TOKENS.getAccessToken())
                        .cookie(COOKIE)
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isNoContent())
                .andReturn();

        //then
        Mockito.verify(reservationService).cancel(any());
    }
}