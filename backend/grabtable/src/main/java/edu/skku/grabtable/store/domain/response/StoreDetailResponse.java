package edu.skku.grabtable.store.domain.response;

import edu.skku.grabtable.store.domain.Store;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class StoreDetailResponse {
    private Long id;
    private String storeName;
    private String address;
    private String storePictureUrl;
    private String phone;
    private String description;
    private String category;

    public static StoreDetailResponse of(Store store) {
        return new StoreDetailResponse(
                store.getId(),
                store.getStoreName(),
                store.getAddress(),
                store.getStorePictureUrl(),
                store.getPhone(),
                store.getDescription(),
                store.getCategory().toString()
        );
    }
}
