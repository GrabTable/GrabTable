package edu.skku.grabtable.payment.repository;

import edu.skku.grabtable.payment.domain.Bill;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BillRepository extends JpaRepository<Bill, Long> {
}
