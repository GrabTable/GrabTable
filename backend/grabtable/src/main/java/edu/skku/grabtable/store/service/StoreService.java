package edu.skku.grabtable.store.service;

import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.domain.response.MenuResponse;
import edu.skku.grabtable.store.domain.response.StoreDetailResponse;
import edu.skku.grabtable.store.domain.response.StoreInfoResponse;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.store.repository.StoreRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class StoreService {

    private final StoreRepository storeRepository;
    private final MenuRepository menuRepository;


    public List<StoreInfoResponse> findAll() {
        return storeRepository.findAll().stream().map(StoreInfoResponse::of).toList();
    }

    public StoreDetailResponse findById(Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));

        return StoreDetailResponse.of(store);
    }

    public List<MenuResponse> findStoreMenus(Long storeId) {
        return menuRepository.findByStoreId(storeId).stream().map(MenuResponse::of).toList();
    }
}
