package edu.skku.grabtable.store.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.common.ControllerTest;
import edu.skku.grabtable.store.domain.response.MenuResponse;
import edu.skku.grabtable.store.domain.response.StoreDetailResponse;
import edu.skku.grabtable.store.domain.response.StoreInfoResponse;
import edu.skku.grabtable.store.service.StoreService;
import java.util.List;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MvcResult;

@WebMvcTest(StoreController.class)
@AutoConfigureRestDocs
class StoreControllerTest extends ControllerTest {

    @MockBean
    private StoreService storeService;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    @DisplayName("가게 목록을 조회할 수 있다.")
    void findStores() throws Exception {
        StoreInfoResponse store1 = new StoreInfoResponse(1L, "봉수육", 1.0, 2.0, "경기 수원시 장안구 화산로", "",
                "KOREAN", 4.5);
        StoreInfoResponse store2 = new StoreInfoResponse(1L, "미가라멘", 2.0, 4.0, "경기 수원시 장안구 화산로", "",
                "JAPANESE", 4.23);
        List<StoreInfoResponse> storesResponse = List.of(store1, store2);

        //given
        Mockito.when(storeService.findAll()).thenReturn(storesResponse);

        mockMvc.perform(get("/v1/stores"))
                .andExpect(status().isOk())
                .andReturn();

        //then
        Mockito.verify(storeService).findAll();
    }

    @Test
    @DisplayName("단일 가게를 가게 ID로 조회할 수 있다.")
    void findStoreById() throws Exception {
        StoreDetailResponse response = new StoreDetailResponse(1L, "봉수육", "경기 수원시 장안구 화산로",
                "", "0320000000", "수육나베를 파는 곳", "KOREAN");
        //given
        Mockito.when(storeService.findById(anyLong()))
                .thenReturn(response);
        //when
        MvcResult mvcResult = mockMvc.perform(get("/v1/stores/{storeId}", "1"))
                .andExpect(status().isOk())
                .andReturn();
        //then
        StoreDetailResponse actual = objectMapper.readValue(
                mvcResult.getResponse().getContentAsString(),
                StoreDetailResponse.class
        );

        assertThat(actual).usingRecursiveComparison().isEqualTo(response);
    }

    @Test
    @DisplayName("단일 가게의 메뉴 목록을 가게 ID로 조회할 수 있다.")
    void findMenusByStoreId() throws Exception {
        MenuResponse menu1 = new MenuResponse(1L, "수육나베", 20000, "");
        MenuResponse menu2 = new MenuResponse(2L, "수육튀김", 10000, "");
        List<MenuResponse> response = List.of(menu1, menu2);

        //given
        Mockito.when(storeService.findStoreMenus(anyLong()))
                .thenReturn(response);

        //when
        mockMvc.perform(get("/v1/stores/{storeId}/menus", "1"))
                .andExpect(status().isOk())
                .andReturn();

        //then
        Mockito.verify(storeService).findStoreMenus(anyLong());
    }


}