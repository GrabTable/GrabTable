package edu.skku.grabtable.common.domain.response;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class SliceResponse<T> {
    private List<T> values;
    private Boolean hasNext;
    private Long cursor;

    public static <T> SliceResponse<T> of(List<T> values, Boolean hasNext, Long cursor) {
        return new SliceResponse(values, hasNext, cursor);
    }
}
