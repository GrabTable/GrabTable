package edu.skku.grabtable.reservation.domain;

import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.user.domain.User;
import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class ReservationHistory {
    private Long reservationId;
    private UserHistory host;
    private List<UserHistory> invitees;
    private SharedOrderHistory sharedOrder;
    private List<OrderHistory> orders;
    private StoreHistory store;
    private LocalDateTime createdAt;
    private LocalDateTime confirmedAt;

    @Builder
    @AllArgsConstructor
    @Getter
    public static class UserHistory {
        private Long userId;
        private String socialLoginId;
        private String username;

        public static UserHistory of(User user) {
            return UserHistory.builder()
                    .userId(user.getId())
                    .username(user.getUsername())
                    .socialLoginId(user.getSocialLoginId())
                    .build();
        }
    }

    @Builder
    @AllArgsConstructor
    @Getter
    public static class StoreHistory {
        private Long storeId;
        private String storeName;
        private String address;

        public static StoreHistory of(Store store) {
            return StoreHistory.builder()
                    .storeId(store.getId())
                    .storeName(store.getStoreName())
                    .address(store.getAddress())
                    .build();
        }
    }

    @Builder
    @AllArgsConstructor
    @Getter
    public static class SharedOrderHistory {
        private Long sharedOrderId;
        private List<CartHistory> carts;
        private List<OrderHistory> orders;
        private Integer totalPrice;

        public static SharedOrderHistory from(
                SharedOrder sharedOrder,
                List<OrderHistory> orders
        ) {
            return SharedOrderHistory.builder()
                    .sharedOrderId(sharedOrder.getId())
                    .carts(sharedOrder.getCarts().stream().map(CartHistory::of).toList())
                    .orders(orders)
                    .totalPrice(sharedOrder.calculateTotalAmount())
                    .build();
        }

    }

    @Builder
    @AllArgsConstructor
    @Getter
    public static class OrderHistory {
        private Long orderId;
        private List<CartHistory> carts;
        private UserHistory paidUser;
        private Integer totalPrice;

        public static OrderHistory of(Order order) {
            return OrderHistory.builder()
                    .orderId(order.getId())
                    .carts(order.getCarts().stream().map(CartHistory::of).toList())
                    .paidUser(UserHistory.of(order.getUser()))
                    .totalPrice(order.getTotalPrice())
                    .build();
        }


    }

    @Builder
    @AllArgsConstructor
    @Getter
    public static class CartHistory {
        private Long cartId;
        private String menuName;
        private Integer unitPrice;
        private Integer quantity;
        private Integer totalPrice;

        public static CartHistory of(Cart cart) {
            return CartHistory.builder()
                    .cartId(cart.getId())
                    .menuName(cart.getMenuName())
                    .unitPrice(cart.getUnitPrice())
                    .quantity(cart.getQuantity())
                    .totalPrice(cart.calculateTotalPrice())
                    .build();
        }
    }
}
