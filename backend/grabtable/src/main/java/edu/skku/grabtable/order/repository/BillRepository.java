package edu.skku.grabtable.order.repository;

import edu.skku.grabtable.order.domain.PayOneBill;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BillRepository extends JpaRepository<PayOneBill, Long> {
}
