package edu.skku.grabtable.cart.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartRequest;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
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

    public List<Cart> getCurrentCarts(User user) {
        return cartRepository.findByUserId(user.getId());
    }

    public Cart createCart(User user, CartRequest cartRequest) {
        Menu menu = menuRepository.findById(cartRequest.getMenuId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.INVALID_REQUEST));
        Cart cart = new Cart(user, menu, cartRequest.getQuantity());
        cartRepository.save(cart);

        return cart;
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

    public void modifyCart(Long id, Long cartId, CartRequest cartRequest) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.INVALID_REQUEST));
        if (!Objects.equals(cart.getUser().getId(), id)) {
            throw new BadRequestException(ExceptionCode.INVALID_REQUEST);
        }
        Menu menu = menuRepository.findById(cartRequest.getMenuId())
                .orElseThrow(() -> new BadRequestException(ExceptionCode.INVALID_REQUEST));

        cart.modifyCart(menu, cartRequest.getQuantity());
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
