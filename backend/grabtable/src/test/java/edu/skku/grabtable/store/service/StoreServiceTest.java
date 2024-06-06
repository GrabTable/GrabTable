package edu.skku.grabtable.store.service;

import edu.skku.grabtable.store.domain.Menu;
import edu.skku.grabtable.store.domain.MenuStatus;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.domain.StoreCategory;
import edu.skku.grabtable.store.domain.StoreStatus;
import edu.skku.grabtable.store.domain.response.MenuResponse;
import edu.skku.grabtable.store.repository.MenuRepository;
import edu.skku.grabtable.store.repository.StoreRepository;
import java.util.ArrayList;
import java.util.List;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class StoreServiceTest {

    @Mock
    StoreRepository storeRepository;

    @Mock
    MenuRepository menuRepository;

    @InjectMocks
    StoreService storeService;


    @Test
    @DisplayName("가게 ID로 가게 메뉴를 조회할 수 있다.")
    void findMenusByStoreId() {
        //given
        Store store = new Store(1L, "Ramen", "Seoul", null, null, null, null,
                StoreStatus.VALID, StoreCategory.JAPANESE, new ArrayList<>(), new ArrayList<>());
        Menu menu1 = new Menu(1L, store, "돈코츠라멘", 10000, null, MenuStatus.VALID);
        Menu menu2 = new Menu(1L, store, "미소라멘", 8000, null, MenuStatus.VALID);
        Menu menu3 = new Menu(1L, store, "쯔유라멘", 11000, null, MenuStatus.VALID);

        Mockito.when(menuRepository.findByStoreId(1L))
                .thenReturn(List.of(menu1, menu2, menu3));

        //when
        List<MenuResponse> storeMenus = storeService.findStoreMenus(1L);

        //then
        Assertions.assertThat(storeMenus.size()).isEqualTo(3);

    }
}