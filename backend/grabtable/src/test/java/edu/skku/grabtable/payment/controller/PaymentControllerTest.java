package edu.skku.grabtable.payment.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.payment.domain.Bill;
import edu.skku.grabtable.payment.domain.request.PaymentRequestDto;
import edu.skku.grabtable.payment.service.PaymentService;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;

import java.math.BigDecimal;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(PaymentController.class)
@AutoConfigureRestDocs
public class PaymentControllerTest extends ControllerTest {
    private static final String IMPUID = "example_uid";
    private static final BigDecimal AMOUNT = BigDecimal.valueOf(10_000);
    private static final String MERCHANTUID = "example_merchant_uid";
    private static final String RECEIPTURL = "example_url";

    @MockBean
    private PaymentService paymentService;

    @Autowired
    ObjectMapper objectMapper;

    @Test
    @DisplayName("결제 정보 인증을 수행할 수 있다")
    public void payment() throws Exception {
        //given
        PaymentRequestDto paymentRequest = new PaymentRequestDto(IMPUID, AMOUNT);
        Bill expected = new Bill(IMPUID, MERCHANTUID, RECEIPTURL, AMOUNT);
        Mockito.when(paymentService.verify(ArgumentMatchers.any()))
                .thenReturn(expected);
        //when
        MvcResult mvcResult = mockMvc.perform(post("/v1/payment/verify")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(paymentRequest)))
                .andExpect(status().isOk())
                .andReturn();

        //then
        Bill response = objectMapper.readValue(
                mvcResult.getResponse().getContentAsString(),
                Bill.class
        );

        Assertions.assertThat(response).usingRecursiveComparison().isEqualTo(expected);
    }
}
