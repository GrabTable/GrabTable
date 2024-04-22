package edu.skku.grabtable.store.domain.response;

import edu.skku.grabtable.store.domain.Menu;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class MenuResponse {
    private Long id;
    private String menuName;
    private Integer price;
    private String menuPictureUrl;
    private String status;

    public static MenuResponse of(Menu menu) {
        return new MenuResponse(
                menu.getId(),
                menu.getMenuName(),
                menu.getPrice(),
                menu.getMenuPictureUrl(),
                menu.getStatus().toString()
        );
    }
}
