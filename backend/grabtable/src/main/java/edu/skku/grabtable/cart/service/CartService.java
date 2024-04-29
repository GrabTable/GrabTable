package edu.skku.grabtable.cart.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartUpdateRequest;
import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import java.util.List;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
@RequiredArgsConstructor
public class CartService {
    private final CartRepository cartRepository;
    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final MenuRepository menuRepository;

    public List<CartResponse> getCurrentCarts(User user) {
        return cartRepository.findByUserId(user.getId()).stream().map(CartResponse::of).toList();
    }

    public Cart createCart(User user, CartRequest cartRequest) {
        Menu menu = menuRepository.findById(cartRequest.getMenuId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.INVALID_REQUEST));
        Cart cart = new Cart(user, menu, cartRequest.getQuantity());
        cartRepository.save(cart);

        return cart;
    }

    public void updateCart(User user, CartUpdateRequest cartUpdateRequest) {
        Cart cart = cartRepository.findById(cartUpdateRequest.getCartId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));

        if (!Objects.equals(cart.getUser().getId(), user.getId())) {
            throw new BadRequestException(ExceptionCode.UNAUTHORIZED_ACCESS);
        }

        cart.changeQuantity(cartUpdateRequest.getQuantity());
    }


    public void deleteCart(Long id, Long cartId) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.INVALID_REQUEST));
        if (!Objects.equals(cart.getUser().getId(), id)) {
            throw new BadRequestException(ExceptionCode.INVALID_REQUEST);
        }
        cart.disconnectUser();
        cartRepository.deleteById(cart.getId());
    }
}
