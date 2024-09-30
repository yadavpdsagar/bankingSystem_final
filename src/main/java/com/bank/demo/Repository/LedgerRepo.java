package com.bank.demo.Repository;

import com.bank.demo.Model.Ledger;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LedgerRepo extends JpaRepository<Ledger,Integer > {

    Optional<Ledger> findByledgerId(Integer ledgerId);
}
