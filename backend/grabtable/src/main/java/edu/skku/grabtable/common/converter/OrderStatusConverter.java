package edu.skku.grabtable.common.converter;

import edu.skku.grabtable.order.domain.OrderStatus;
import org.springframework.core.convert.converter.Converter;

public class OrderStatusConverter implements Converter<String, OrderStatus> {
    @Override
    public OrderStatus convert(String source) {
        return OrderStatus.create(source.toUpperCase());
    }
}
