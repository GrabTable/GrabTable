package edu.skku.grabtable.common.inspector;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class QueryCountInspectorTest {

    @Autowired
    private QueryCountInspector queryCountInspector;

    @Test
    @DisplayName("JPA에 의해 inspect 메소드가 호출되면 SQL 쿼리 counter가 증가한다.")
    void inspect() {
        // given
        queryCountInspector.startCounter();

        // when
        queryCountInspector.inspect("test query");

        // then
        Assertions.assertThat(queryCountInspector.getCount()).isOne();
    }
}