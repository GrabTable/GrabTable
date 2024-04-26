package edu.skku.grabtable.store.controller;

import edu.skku.grabtable.store.domain.response.MenuResponse;
import edu.skku.grabtable.store.domain.response.StoreDetailResponse;
import edu.skku.grabtable.store.domain.response.StoreInfoResponse;
import edu.skku.grabtable.store.service.StoreService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/stores")
@RequiredArgsConstructor
public class StoreController {

    private final StoreService storeService;

    @GetMapping
    public List<StoreInfoResponse> findStores() {
        return storeService.findAll();
    }

    @GetMapping("/{storeId}")
    public StoreDetailResponse getStoreInfo(@PathVariable Long storeId) {
        return storeService.findById(storeId);
    }

    @GetMapping("/{storeId}/menus")
    public List<MenuResponse> getStoreMenus(@PathVariable Long storeId) {
        return storeService.findStoreMenus(storeId);
    }
}
