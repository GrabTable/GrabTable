package edu.skku.grabtable.reservation.domain.response;

import edu.skku.grabtable.cart.domain.response.CartResponse;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UserCartsInfoResponse {
    private Long id;
    private String username;
    private String profileImageUrl;
    private List<CartResponse> currentCarts;
    
    public static UserCartsInfoResponse of(Long userId, String username, String profileImageUrl,
                                           List<CartResponse> carts) {
        return new UserCartsInfoResponse(userId, username, profileImageUrl, carts);
    }
}
