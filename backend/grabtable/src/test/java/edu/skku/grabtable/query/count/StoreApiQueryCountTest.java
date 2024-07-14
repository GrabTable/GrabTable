package edu.skku.grabtable.query.count;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
@Sql(value = {
        "classpath:data/stores.sql"
})
public class StoreApiQueryCountTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    @DisplayName("GET /v1/stores 쿼리 개수 측정")
    void countGetV1Stores() throws Exception {
        mockMvc.perform(get("/v1/stores"))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("GET /v1/stores/{storeId} 쿼리 개수 측정")
    void countGetV1StoresStoreId() throws Exception {
        mockMvc.perform(get("/v1/stores/{storeId}", 1))
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    @DisplayName("Get /v1/stores/{storeId}/menus 쿼리 개수 측정")
    void countGetV1StoresStoreIdMenus() throws Exception {
        mockMvc.perform(get("/v1/stores/{storeId}/menus", 1))
                .andExpect(status().isOk())
                .andReturn();
    }


}
