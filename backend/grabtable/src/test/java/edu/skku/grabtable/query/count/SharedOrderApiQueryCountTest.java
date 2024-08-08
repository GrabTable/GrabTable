package edu.skku.grabtable.query.count;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.auth.JwtUtil;
import edu.skku.grabtable.auth.domain.UserTokens;
import edu.skku.grabtable.order.domain.request.PrePaymentRequest;
import edu.skku.grabtable.order.infrastructure.PaymentValidator;
import jakarta.servlet.http.Cookie;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
@Sql(
        value = {
                "classpath:data/users.sql",
                "classpath:data/stores.sql",
                "classpath:data/shared_orders.sql",
                "classpath:data/reservations.sql",
                "classpath:data/orders.sql",
                "classpath:data/carts.sql"
        }
)
public class SharedOrderApiQueryCountTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private PaymentValidator paymentValidator;

    @Test
    @DisplayName("POST /v1/shared-orders 쿼리 개수 측정")
    void countPostV1SharedOrders() throws Exception {
        UserTokens loginToken = jwtUtil.createLoginToken(String.valueOf(3L));

        //주의: carts.sql 수정 시 테스트 실패할 수 있음
        PrePaymentRequest prePaymentRequest = new PrePaymentRequest(1000L, 100L, 1000);

        mockMvc.perform(post("/v1/shared-orders/prepayment")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + loginToken.getAccessToken())
                        .cookie(new Cookie("refresh-token", loginToken.getRefreshToken()))
                        .content(objectMapper.writeValueAsString(prePaymentRequest)))
                .andExpect(status().isCreated())
                .andReturn();
    }
}
