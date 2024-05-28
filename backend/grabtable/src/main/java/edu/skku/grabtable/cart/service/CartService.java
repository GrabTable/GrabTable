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
    private final ReservationRepository reservationRepository;

    @Transactional(readOnly = true)
    public List<CartResponse> findMyCarts(Long userId) {
        return cartRepository.findByUserId(userId).stream().map(CartResponse::of).toList();
    }

    public void createCart(User user, Long menuId, Integer quantity) {
        Menu menu = menuRepository.findById(menuId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_MENU_ID));

        //사용자의 현재 카트에 이미 같은 이름의 메뉴가 존재하면 예외 처리
        boolean alreadyExist = cartRepository.existsByUserIdAndMenuName(user.getId(), menu.getMenuName());

        if (alreadyExist) {
            throw new BadRequestException(ExceptionCode.ALREADY_EXISTING_CART);
        }

        //사용자가 현재 예약 중인 가게에 없는 메뉴라면 예외처리 TODO
        //사용자가 예약 상태가 아니면 예외처리 TODO

        Cart cart = new Cart(user, menu, quantity);
        cartRepository.save(cart);
    }

    public void updateCart(User user, Long cartId, CartUpdateRequest cartUpdateRequest) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));

        if (cart.getUser() == null || !Objects.equals(cart.getUser().getId(), user.getId())) {
            throw new BadRequestException(ExceptionCode.UNAUTHORIZED_ACCESS);
        }

        cart.changeQuantity(cartUpdateRequest.getQuantity());
    }


    public void deleteCart(Long userId, Long cartId) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));

        if (cart.getUser() == null || !Objects.equals(cart.getUser().getId(), userId)) {
            throw new BadRequestException(ExceptionCode.INVALID_REQUEST);
        }
        cart.disconnectUser();
        cartRepository.deleteById(cart.getId());
    }

    /* === 공유 주문 기능 === */

    @Transactional(readOnly = true)
    public List<CartResponse> findSharedCarts(User user) {
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        SharedOrder sharedOrder = reservation.getSharedOrder();

        return sharedOrder.getCarts().stream().map(CartResponse::of).toList();
    }

    public void createSharedCart(User user, Long menuId, Integer quantity) {
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = reservation.getSharedOrder();
        Menu menu = menuRepository.findById(menuId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_MENU_ID));

        //현재 카트에 이미 같은 이름의 메뉴가 존재하면 예외 처리
        boolean alreadyExist = cartRepository.existsBySharedOrderIdAndMenuName(sharedOrder.getId(), menu.getMenuName());

        if (alreadyExist) {
            throw new BadRequestException(ExceptionCode.ALREADY_EXISTING_CART);
        }

        //현재 예약 중인 가게에 없는 메뉴라면 예외처리 TODO

        Cart cart = new Cart(sharedOrder, menu, quantity);
        cartRepository.save(cart);
    }

    public void updateSharedCart(User user, Long cartId, CartUpdateRequest cartUpdateRequest) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = reservation.getSharedOrder();

        if (cart.getSharedOrder() == null || !Objects.equals(cart.getSharedOrder().getId(), sharedOrder.getId())) {
            throw new BadRequestException(ExceptionCode.UNAUTHORIZED_ACCESS);
        }

        cart.changeQuantity(cartUpdateRequest.getQuantity());
    }


    public void deleteSharedCart(User user, Long cartId) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_CART_ID));
        Reservation reservation = reservationRepository.findByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));
        SharedOrder sharedOrder = reservation.getSharedOrder();

        if (cart.getSharedOrder() == null || !Objects.equals(cart.getSharedOrder().getId(), sharedOrder.getId())) {
            throw new BadRequestException(ExceptionCode.UNAUTHORIZED_ACCESS);
        }

        cartRepository.deleteById(cart.getId());
    }


}
