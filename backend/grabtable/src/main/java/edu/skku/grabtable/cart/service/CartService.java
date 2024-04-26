package edu.skku.grabtable.cart.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartRequest;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.domain.Order;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.repository.OrderRepository;
import edu.skku.grabtable.repository.UserRepository;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.repository.MenuRepository;
import java.util.List;
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

    public final List<Cart> getCurrentCarts(Long id) {
        return cartRepository.findByUserId(id);
    }

    public void createCart(Long userId, CartRequest cartRequest) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));
        Menu menu = menuRepository.findById(cartRequest.getMenuId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.INVALID_REQUEST));

        Cart cart = new Cart(user, menu, cartRequest.getQuantity());
        cartRepository.save(cart);
    }

    public Order confirmCurrentCarts(Long id) {
        List<Cart> currentCarts = cartRepository.findByUserId(id);
        for (Cart currentCart : currentCarts) {
            currentCart.disconnectUser();
        }
        Order order = new Order(currentCarts);
        orderRepository.save(order);
        return order;
    }
}
