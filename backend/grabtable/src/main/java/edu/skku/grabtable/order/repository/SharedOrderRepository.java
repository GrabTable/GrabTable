package edu.skku.grabtable.order.repository;

import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.reservation.domain.Reservation;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SharedOrderRepository extends JpaRepository<SharedOrder, Long> {

    Optional<SharedOrder> findByReservation(Reservation reservation);


    //ReservationHistory를 위한 일괄 조회 시 네이티브 쿼리 작성 필요
    //둘 이상의 컬렉션 페치 조인 불가
    @Query("""
            SELECT so
            FROM SharedOrder so
            LEFT JOIN FETCH so.carts c
            WHERE so.reservation = :reservation
            """)
    Optional<SharedOrder> findByReservationFetchJoin(Reservation reservation);
}
