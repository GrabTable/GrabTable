package edu.skku.grabtable.cart.facade;

import edu.skku.grabtable.cart.domain.request.CartUpdateRequest;
import edu.skku.grabtable.cart.repository.LockRepository;
import edu.skku.grabtable.cart.service.CartService;
import edu.skku.grabtable.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Component
public class NamedLockCartFacade {
    private final LockRepository lockRepository;
    private final CartService cartService;

    @Transactional
    public void update(Long cartId, User user, CartUpdateRequest cartRequest) {
        try {
            lockRepository.getLock(String.valueOf(cartId));  /* key로써 충분한지? */
            cartService.updateCartInSharedOrder(user, cartId, cartRequest);
        } finally {
            lockRepository.releaseLock(String.valueOf(cartId));
        }
    }
}
