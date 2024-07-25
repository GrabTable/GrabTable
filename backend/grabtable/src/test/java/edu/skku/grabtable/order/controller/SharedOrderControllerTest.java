package edu.skku.grabtable.order.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.order.domain.request.PrePaymentRequest;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.service.SharedOrderService;
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
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

@WebMvcTest(SharedOrderController.class)
@AutoConfigureRestDocs
class SharedOrderControllerTest extends ControllerTest {

    private static final String ACCESS_TOKEN = "access_token";
    private static final String REFRESH_TOKEN = "refresh_token";

    @Autowired
    ObjectMapper objectMapper;

    @MockBean
    SharedOrderService sharedOrderService;

    @Test
    @DisplayName("사용자가 공유 주문에 대해 결제할 수 있다.")
    void processPayment() throws Exception {
        //given
        //TODO: reservation 생성
        OrderResponse expected = new OrderResponse(1L, 1L, null, 10000, "PENDING");
        PrePaymentRequest paymentRequest = new PrePaymentRequest(1L, 1L, 10000);
        Mockito.when(sharedOrderService.prePayment(any(), any()))
                .thenReturn(expected);

        //when
        MvcResult mvcResult = mockMvc.perform(post("/v1/shared-orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, ACCESS_TOKEN)
                        .cookie(new Cookie("refresh-token", REFRESH_TOKEN))
                        .content(objectMapper.writeValueAsString(paymentRequest)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isCreated())
                .andReturn();

        OrderResponse actual = objectMapper.readValue(
                mvcResult.getResponse().getContentAsString(),
                OrderResponse.class
        );

        //then
        assertThat(actual).usingRecursiveComparison().isEqualTo(expected);
    }
}