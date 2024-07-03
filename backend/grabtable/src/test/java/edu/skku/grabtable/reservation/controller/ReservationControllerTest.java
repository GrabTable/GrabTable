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
import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.domain.response.SharedOrderResponse;
import edu.skku.grabtable.reservation.domain.request.ReservationRequest;
import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import edu.skku.grabtable.reservation.domain.response.UserCartsInfoResponse;
import edu.skku.grabtable.reservation.service.ReservationService;
import jakarta.servlet.http.Cookie;
import java.util.List;
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
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

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
        CartResponse coke = new CartResponse(1L, "coke", 5, 2000, 10000);
        CartResponse juice = new CartResponse(2L, "juice", 1, 2000, 2000);
        CartResponse water = new CartResponse(3L, "water", 3, 500, 1500);
        CartResponse cake = new CartResponse(4L, "cake", 1, 5400, 5400);
        CartResponse doughnut = new CartResponse(5L, "doughnut", 1, 3900, 3900);

        UserCartsInfoResponse host = new UserCartsInfoResponse(1L, "host", "https://image.url", List.of(cake));
        UserCartsInfoResponse userA = new UserCartsInfoResponse(2L, "userA", "https://image2.url", List.of(doughnut));

        OrderResponse orderResponse = new OrderResponse(1L, 1L, List.of(coke), 10000, "PAID");
        OrderResponse orderResponse2 = new OrderResponse(2L, 1L, List.of(juice, water), 3500, "PAID");
        SharedOrderResponse sharedOrderResponse = new SharedOrderResponse(1L, List.of(coke), List.of(orderResponse),
                10000, 10000);

        ReservationDetailResponse response = new ReservationDetailResponse(1L, 1L, host, List.of(userA),
                "invite-code", sharedOrderResponse, List.of(orderResponse2));
        when(reservationService.findOngoingReservationByUser(any()))
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
                                        .type(JsonFieldType.OBJECT)
                                        .description("호스트 사용자 및 장바구니 정보"),
                                fieldWithPath("invitees")
                                        .type(JsonFieldType.ARRAY)
                                        .description("예약 참여자들 사용자 및 장바구니 정보"),
                                fieldWithPath("inviteCode")
                                        .type(JsonFieldType.STRING)
                                        .description("초대 코드"),
                                fieldWithPath("sharedOrder")
                                        .type(JsonFieldType.OBJECT)
                                        .description("공유 주문 정보"),
                                fieldWithPath("orders")
                                        .type(JsonFieldType.ARRAY)
                                        .description("개인별 주문 정보"),

                                fieldWithPath("host.id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("호스트 유저 ID"),
                                fieldWithPath("host.username")
                                        .type(JsonFieldType.STRING)
                                        .description("호스트 유저 이름"),
                                fieldWithPath("host.profileImageUrl")
                                        .type(JsonFieldType.STRING)
                                        .description("호스트 프로필 사진 URL"),
                                fieldWithPath("host.currentCarts")
                                        .type(JsonFieldType.ARRAY)
                                        .description("호스트의 현재 장바구니"),

                                fieldWithPath("host.currentCarts[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("호스트의 현재 장바구니에 담긴 카트 ID"),
                                fieldWithPath("host.currentCarts[].menuName")
                                        .type(JsonFieldType.STRING)
                                        .description("호스트의 현재 장바구니에 담긴 카트명"),
                                fieldWithPath("host.currentCarts[].quantity")
                                        .type(JsonFieldType.NUMBER)
                                        .description("호스트의 현재 장바구니에 담긴 카트 수량"),
                                fieldWithPath("host.currentCarts[].price")
                                        .type(JsonFieldType.NUMBER)
                                        .description("호스트의 현재 장바구니에 담긴 카트의 단일 가격"),
                                fieldWithPath("host.currentCarts[].totalPrice")
                                        .type(JsonFieldType.NUMBER)
                                        .description("호스트의 현재 장바구니에 담긴 상품의 수량과 단일 가격을 곱한 가격"),

                                fieldWithPath("invitees[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("참가자 유저 ID"),
                                fieldWithPath("invitees[].username")
                                        .type(JsonFieldType.STRING)
                                        .description("참가자 유저 이름"),
                                fieldWithPath("invitees[].profileImageUrl")
                                        .type(JsonFieldType.STRING)
                                        .description("참가자 프로필 사진 URL"),
                                fieldWithPath("invitees[].currentCarts")
                                        .type(JsonFieldType.ARRAY)
                                        .description("참가자의 현재 장바구니"),
                                fieldWithPath("invitees[].currentCarts")
                                        .type(JsonFieldType.ARRAY)
                                        .description("참가자의 현재 장바구니"),

                                fieldWithPath("invitees[].currentCarts[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("참가자의 현재 장바구니에 담긴 카트 ID"),
                                fieldWithPath("invitees[].currentCarts[].menuName")
                                        .type(JsonFieldType.STRING)
                                        .description("참가자의 현재 장바구니에 담긴 카트 상품명"),
                                fieldWithPath("invitees[].currentCarts[].quantity")
                                        .type(JsonFieldType.NUMBER)
                                        .description("참가자의 현재 장바구니에 담긴 카트 상품 수량"),
                                fieldWithPath("invitees[].currentCarts[].price")
                                        .type(JsonFieldType.NUMBER)
                                        .description("참가자의 현재 장바구니에 담긴 카트 상품의 단일 가격"),
                                fieldWithPath("invitees[].currentCarts[].totalPrice")
                                        .type(JsonFieldType.NUMBER)
                                        .description("참가자의 현재 장바구니에 담긴 카트 상품의 수량과 단일 가격을 곱한 가격"),

                                fieldWithPath("sharedOrder.id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("예약에 할당된 공유 주문 ID"),
                                fieldWithPath("sharedOrder.carts")
                                        .type(JsonFieldType.ARRAY)
                                        .description("공유 주문의 장바구니"),
                                fieldWithPath("sharedOrder.orders")
                                        .type(JsonFieldType.ARRAY)
                                        .description("공유 주문에 대해 완료된 결제들"),
                                fieldWithPath("sharedOrder.totalAmount")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문의 총 금액"),
                                fieldWithPath("sharedOrder.leftAmount")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문의 미결제 금액"),

                                fieldWithPath("sharedOrder.carts[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문 장바구니에 있는 카트 ID"),
                                fieldWithPath("sharedOrder.carts[].menuName")
                                        .type(JsonFieldType.STRING)
                                        .description("공유 주문 장바구니에 있는 카트 상품명"),
                                fieldWithPath("sharedOrder.carts[].quantity")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문 장바구니에 있는 카트 상품 수량"),
                                fieldWithPath("sharedOrder.carts[].price")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문 장바구니에 있는 카트 상품의 단일 가격"),
                                fieldWithPath("sharedOrder.carts[].totalPrice")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문 장바구니에 있는 카트 상품의 전체 가격"),

                                fieldWithPath("sharedOrder.orders[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문에 있는 결제 완료된 주문의 ID"),
                                fieldWithPath("sharedOrder.orders[].userId")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문에 있는 결제 완료된 주문을 결제한 사용자의 ID"),
                                fieldWithPath("sharedOrder.orders[].carts")
                                        .type(JsonFieldType.ARRAY)
                                        .description("공유 주문에 있는 결제 완료된 주문의 카트 리스트"),
                                fieldWithPath("sharedOrder.orders[].paidAmount")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문에 있는 결제 완료된 주문의 결제된 금액"),
                                fieldWithPath("sharedOrder.orders[].status")
                                        .type(JsonFieldType.STRING)
                                        .description("공유 주문에 있는 결제 완료된 주문의 결제 완료 여부"),

                                fieldWithPath("sharedOrder.orders[].carts[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문에 있는 결제 완료된 주문의 단일 카트 ID"),
                                fieldWithPath("sharedOrder.orders[].carts[].menuName")
                                        .type(JsonFieldType.STRING)
                                        .description("공유 주문에 있는 결제 완료된 주문의 단일 카트 상품명"),
                                fieldWithPath("sharedOrder.orders[].carts[].quantity")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문에 있는 결제 완료된 주문의 단일 카트 상품 수량"),
                                fieldWithPath("sharedOrder.orders[].carts[].price")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문에 있는 결제 완료된 주문의 단일 카트 상품 가격"),
                                fieldWithPath("sharedOrder.orders[].carts[].totalPrice")
                                        .type(JsonFieldType.NUMBER)
                                        .description("공유 주문에 있는 결제 완료된 주문의 단일 카트 상품 전체 가격"),

                                fieldWithPath("orders[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("결제된 개인 주문의 ID"),
                                fieldWithPath("orders[].userId")
                                        .type(JsonFieldType.NUMBER)
                                        .description("결제된 개인 주문을 결제한 사용자의 ID"),
                                fieldWithPath("orders[].carts")
                                        .type(JsonFieldType.ARRAY)
                                        .description("결제된 개인 주문의 카트 리스트"),
                                fieldWithPath("orders[].paidAmount")
                                        .type(JsonFieldType.NUMBER)
                                        .description("개인 주문의 결제된 금액"),
                                fieldWithPath("orders[].status")
                                        .type(JsonFieldType.STRING)
                                        .description("결제된 개인 주문의 결제 완료 여부"),

                                fieldWithPath("orders[].carts[].id")
                                        .type(JsonFieldType.NUMBER)
                                        .description("결제된 개인 주문의 단일 카트 ID"),
                                fieldWithPath("orders[].carts[].menuName")
                                        .type(JsonFieldType.STRING)
                                        .description("결제된 개인 주문의 단일 카트 상품명"),
                                fieldWithPath("orders[].carts[].quantity")
                                        .type(JsonFieldType.NUMBER)
                                        .description("결제된 개인 주문의 단일 카트 상품 수량"),
                                fieldWithPath("orders[].carts[].price")
                                        .type(JsonFieldType.NUMBER)
                                        .description("결제된 개인 주문의 단일 카트 상품 가격"),
                                fieldWithPath("orders[].carts[].totalPrice")
                                        .type(JsonFieldType.NUMBER)
                                        .description("결제된 개인 주문의 단일 카트 상품 전체 가격")

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
    @DisplayName("유저의 현재 예약 정보를 SSE로 받아올 수 있다.")
    void subscribe() throws Exception {
        //given
        ReservationDetailResponse data = new ReservationDetailResponse(1L, 1L, null, null,
                "invite-code", null, null);
        SseEmitter expected = new SseEmitter(10L * 1000 * 60);

        when(reservationService.createEmitter(any()))
                .thenReturn(expected);

        new Thread(() -> {
            try {
                expected.send(SseEmitter.event()
                        .id("1L")
                        .name("reservation")
                        .data(data)
                );
                expected.complete();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();

        //when
        MvcResult mvcResult = mockMvc.perform(get("/v1/reservations/me/subscribe")
                        .header(HttpHeaders.AUTHORIZATION, USER_TOKENS.getAccessToken())
                        .cookie(COOKIE)
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk())
                .andReturn();

        //then
        String contentType = mvcResult.getResponse().getContentType();
        assertThat(contentType).contains(MediaType.TEXT_EVENT_STREAM_VALUE);

        String contentAsString = mvcResult.getResponse().getContentAsString();
        assertThat(contentAsString).contains("id:1L");
        assertThat(contentAsString).contains("event:reservation");
        assertThat(contentAsString).contains("data:");
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