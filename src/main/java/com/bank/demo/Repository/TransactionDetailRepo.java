package com.bank.demo.Repository;

import com.bank.demo.Model.TransactionDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TransactionDetailRepo extends JpaRepository<TransactionDetail,Integer> {
    TransactionDetail findByName(String name );
}
