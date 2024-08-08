package edu.skku.grabtable.order.domain;

public enum OrderStatus {
    PAID, PENDING, CANCELED;

    public static OrderStatus create(String status) {
        for (OrderStatus orderStatus : OrderStatus.values()) {
            if (orderStatus.toString().equals(status)) {
                return orderStatus;
            }
        }

        throw new IllegalStateException("일치하는 status가 없습니다.");
    }
}
