package edu.skku.grabtable.payment.service;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import edu.skku.grabtable.payment.domain.Bill;
import edu.skku.grabtable.payment.domain.request.PaymentRequestDto;
import edu.skku.grabtable.payment.repository.BillRepository;
import org.junit.Test;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.IOException;
import java.math.BigDecimal;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class PaymentServiceTest {

    @Mock
    private BillRepository billRepository;

    @Mock
    private IamportClient iamportClient;
    @InjectMocks
    private PaymentService paymentService;

    private static final String IMPUID = "example_uid";
    private static final BigDecimal AMOUNT = BigDecimal.valueOf(10000);

    static class IamportTestResponse {
        private BigDecimal amount;
         IamportTestResponse(BigDecimal amount) {
          this.amount =  amount;
        }
    }
    @Test
    @DisplayName("아이앰포트 API를 통해 결제를 검증 할 수 있다")
    public void verifyTest() throws IamportResponseException, IOException {
        //given
        PaymentRequestDto paymentRequest = new PaymentRequestDto(IMPUID, AMOUNT);
        IamportTestResponse iamportTestResponse = new IamportTestResponse(AMOUNT);

        IamportResponse<Payment> IamportTestResponse = null;
        when(iamportClient.paymentByImpUid(any(String.class)))
                .thenReturn(iamportTestResponse);
        //when
        Bill result = paymentService.verify(paymentRequest);
        //then
        assertThat(result.getAmount()).isEqualTo(paymentRequest.getAmount());
    }
}
