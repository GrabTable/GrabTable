package edu.skku.grabtable.cart.service;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.request.CartUpdateRequest;
import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.user.domain.User;
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
    private final MenuRepository menuRepository;
    private final OrderRepository orderRepository;
    private final ReservationRepository reservationRepository;

    @Transactional(readOnly = true)
    public List<CartResponse> findMyCarts(Long userId) {
        return cartRepository.findByUserId(userId).stream().map(CartResponse::of).toList();
    }

    public void createCart(User user, Long menuId, Integer quantity) {
        Menu menu = menuRepository.findById(menuId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_MENU_ID));

        validateAlreadyExistingCart(user, menu);
        validateStoreContainsMenu(user, menu);
        validateUserHasReservation(user);
        validateUserHasPaidOrder(user);

        Cart cart = new Cart(user, menu, quantity);
        cartRepository.save(cart);
    }

    public void updateCart(User user, Long cartId, CartUpdateRequest cartUpdateRequest) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));

        validateAuth(user, cart);

        cart.changeQuantity(cartUpdateRequest.getQuantity());
    }

    public void deleteCart(User user, Long cartId) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));

        validateAuth(user, cart);

        cart.disconnectUser();
        cartRepository.deleteById(cart.getId());
    }

    /* === 공유 주문 기능 === */
    public void createCartInSharedOrder(User user, Long menuId, Integer quantity) {
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = reservation.getSharedOrder();
        Menu menu = menuRepository.findById(menuId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_MENU_ID));

        validateAlreadyExistingCartInSharedOrder(sharedOrder, menu);
        validateStoreContainsMenu(user, menu);
        validateUserHasReservation(user);
        validateNoPaidInSharedOrder(user);

        Cart cart = new Cart(sharedOrder, menu, quantity);
        cartRepository.save(cart);
    }

    public void updateCartInSharedOrder(User user, Long cartId, CartUpdateRequest cartUpdateRequest) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));

        validateAuthInSharedOrder(user, cart);
        validateNoPaidInSharedOrder(user);

        cart.changeQuantity(cartUpdateRequest.getQuantity());
    }

    public void deleteCartInSharedOrder(User user, Long cartId) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));

        validateAuthInSharedOrder(user, cart);
        validateNoPaidInSharedOrder(user);

        cartRepository.deleteById(cart.getId());
    }

    /* === 검증 메서드 ==== */

    private void validateUserHasPaidOrder(User user) {
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        if (orderRepository.findByReservationAndUser(reservation, user).isPresent()) {
            throw new BadRequestException(ExceptionCode.ALREADY_PAID_USER);
        }
    }

    private void validateStoreContainsMenu(User user, Menu menu) {
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        if (!menu.getStore().equals(reservation.getStore())) {
            throw new BadRequestException(ExceptionCode.NOT_CONTAIN_MENU);
        }
    }

    private void validateUserHasReservation(User user) {
        if (reservationRepository.findByUser(user).isEmpty()) {
            throw new BadRequestException(ExceptionCode.NO_RESERVATION_USER);
        }
    }

    private void validateAlreadyExistingCart(User user, Menu menu) {
        if (cartRepository.existsByUserIdAndMenuName(user.getId(), menu.getMenuName())) {
            throw new BadRequestException(ExceptionCode.ALREADY_EXISTING_CART);
        }
    }

    private void validateAlreadyExistingCartInSharedOrder(SharedOrder sharedOrder, Menu menu) {
        if (cartRepository.existsBySharedOrderIdAndMenuName(sharedOrder.getId(), menu.getMenuName())) {
            throw new BadRequestException(ExceptionCode.ALREADY_EXISTING_CART);
        }
    }

    private void validateAuth(User user, Cart cart) {
        if (cart.getUser() == null || !Objects.equals(cart.getUser().getId(), user.getId())) {
            throw new BadRequestException(ExceptionCode.UNAUTHORIZED_ACCESS);
        }
    }

    private void validateAuthInSharedOrder(User user, Cart cart) {
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = reservation.getSharedOrder();

        if (cart.getSharedOrder() == null || !Objects.equals(cart.getSharedOrder().getId(), sharedOrder.getId())) {
            throw new BadRequestException(ExceptionCode.UNAUTHORIZED_ACCESS);
        }
    }

    private void validateNoPaidInSharedOrder(User user) {
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = reservation.getSharedOrder();

        if (!sharedOrder.getOrders().isEmpty()) {
            throw new BadRequestException(ExceptionCode.HAS_PAID_IN_SHARED_ORDER);
        }
    }


}
