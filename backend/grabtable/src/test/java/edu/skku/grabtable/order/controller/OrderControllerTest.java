package edu.skku.grabtable.order.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;

@WebMvcTest(OrderController.class)
@AutoConfigureRestDocs
class OrderControllerTest extends ControllerTest {

    private static final String ACCESS_TOKEN = "access_token";
    private static final String REFRESH_TOKEN = "refresh_token";

    @Autowired
    ObjectMapper objectMapper;

    @MockBean
    OrderService orderService;

//    @Test
//    @DisplayName("유저의 현재 카트를 기반으로 주문을 생성할 수 있다.")
//    void create() throws Exception {
//        //given
//        OrderResponse orderResponse = new OrderResponse(1L, 1L, null, 10000, "PAID");
//        PaymentRequest paymentRequest = new PaymentRequest("1", 10000);
//        Mockito.when(orderService.processPayment(any(), any()))
//                .thenReturn(orderResponse);
//
//        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.post("/v1/orders")
//                        .contentType(MediaType.APPLICATION_JSON)
//                        .header(HttpHeaders.AUTHORIZATION, ACCESS_TOKEN)
//                        .cookie(new Cookie("refresh-token", REFRESH_TOKEN))
//                        .content(objectMapper.writeValueAsString(paymentRequest)))
//                .andDo(MockMvcResultHandlers.print())
//                .andExpect(status().isCreated())
//                .andReturn();
//
//        OrderResponse actual = objectMapper.readValue(
//                mvcResult.getResponse().getContentAsString(),
//                OrderResponse.class
//        );
//
//        assertThat(actual).usingRecursiveComparison().isEqualTo(orderResponse);
//    }
}