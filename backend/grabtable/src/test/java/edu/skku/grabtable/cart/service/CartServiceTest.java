package edu.skku.grabtable.cart.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartRequest;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.domain.MenuStatus;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
public class CartServiceTest {

    @InjectMocks
    CartService cartService;

    @Mock
    CartRepository cartRepository;

    @Mock
    MenuRepository menuRepository;

    @Mock
    UserRepository userRepository;

    @Test
    @DisplayName("유저의 모든 장바구니를 조회할 수 있다")
    void findCartsByUserId() {
        //given
        User user = new User(1L, "userA", new ArrayList<>());
        Cart cart = new Cart(1L, user, "menuName", 10000, null, null, 1);
        Cart cart2 = new Cart(2L, user, "menuName", 10000, null, null, 1);
        user.getCarts().add(cart);
        user.getCarts().add(cart);
        when(cartRepository.findByUserId(any(Long.class)))
                .thenReturn(List.of(cart, cart2));

        //when
        List<Cart> result = cartService.getCurrentCarts(user);

        //then
        assertThat(result.size()).isEqualTo(2);
    }

    @Test
    @DisplayName("UserId와 CartId로 유저의 장바구니를 수정할 수 있다")
    void modifyCartByUserIdAndCartId() {
        //given
        CartRequest updateCartRequest = new CartRequest(1L, 2);
        Menu menu = new Menu(1L, null, "menuName", 10000, "url", MenuStatus.VALID);
        Long updateCartId = 1L;
        User user = new User(1L, "userA", new ArrayList<>());
        Cart cart = new Cart(1L, user, "menuName", 10000, null, null, 1);
        user.getCarts().add(cart);
        when(cartRepository.findById(any(Long.class)))
                .thenReturn(Optional.of(cart));
        when(menuRepository.findById(any(Long.class)))
                .thenReturn(Optional.of(menu));

        //when
        cartService.modifyCart(user.getId(), updateCartId, updateCartRequest);

        //then
        assertThat(cart.getQuantity()).isEqualTo(2);
    }

    @Test
    @DisplayName("UserId와 CartId로 유저의 장바구니를 삭제할 수 있다")
    void deleteCartByUserIdAndCartId() {
        //given
        Long deleteCartId = 1L;
        User user = new User(1L, "userA", new ArrayList<>());
        Cart cart = new Cart(1L, user, "menuName", 10000, null, null, 1);
        user.getCarts().add(cart);
        when(cartRepository.findById(any(Long.class)))
                .thenReturn(Optional.of(cart));
        //when
        cartService.deleteCart(user.getId(), deleteCartId);
        //then
        verify(cartRepository).deleteById(deleteCartId);
    }
}
