package edu.skku.grabtable.cart.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartCreateRequest;
import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.common.ControllerTest;
import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;

@WebMvcTest(CartController.class)
@AutoConfigureRestDocs
public class CartControllerTest extends ControllerTest {

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private CartService cartService;


    @Test
    @DisplayName("내 장바구니 목록을 조회할 수 있다")
    void getCarts() throws Exception {
        //given
        Cart cart = new Cart(1L, null, "menu1", 10000, null, null, 1);
        Cart cart2 = new Cart(2L, null, "menu2", 10000, null, null, 1);
        List<CartResponse> expected = Stream.of(cart, cart2)
                .map(CartResponse::of)
                .toList();

        when(cartService.findCurrentCarts(any()))
                .thenReturn(expected);
        //when
        MvcResult mvcResult = mockMvc.perform(get("/v1/cart/me")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andReturn();
        //then
        List<CartResponse> response = objectMapper.readValue(
                mvcResult.getResponse().getContentAsString(),
                new TypeReference<List<CartResponse>>() {
                }
        );

        assertThat(response).extracting(CartResponse::getMenuName).containsExactlyInAnyOrder("menu1", "menu2");
    }

    @Test
    @DisplayName("장바구니에 주문 목록을 추가할 수 있다")
    void createCart() throws Exception {
        //given
        final Cart cart = new Cart(1L, null, "menuName", 10000, null, null, 1);
        CartCreateRequest cartCreateRequest = new CartCreateRequest(1L, 1);

        //when & then
        doNothing().when(cartService).createCart(any(), any(), any());
        mockMvc.perform(post("/v1/cart")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(cartCreateRequest)))
                .andExpect(status().isCreated())
                .andReturn();
    }

    @Test
    @DisplayName("장바구니 주문 목록을 수정할 수 있다")
    void modifyCart() throws Exception {
        //given
        CartCreateRequest updateCartRequest = new CartCreateRequest(1L, 2);
        Long updateCartId = 1L;
        doNothing().when(cartService).updateCart(any(), any());

        //when
        mockMvc.perform(patch("/v1/cart/1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(updateCartRequest)))
                .andDo(print())
                .andExpect(status().isOk());

        //then
        verify(cartService).updateCart(any(), any());
    }

    @Test
    @DisplayName("장바구니 주문 목록을 삭제할 수 있다")
    void deleteCart() throws Exception {
        //given
        doNothing().when(cartService).deleteCart(any(), anyLong());

        //when
        mockMvc.perform(delete("/v1/cart/{cartId}", "1"))
                .andDo(print())
                .andExpect(status().isNoContent());

        //then
        verify(cartService).deleteCart(
                any(),
                anyLong()
        );
    }
}
