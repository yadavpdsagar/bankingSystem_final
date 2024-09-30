package com.bank.demo.service;

import com.bank.demo.Model.Ledger;
import com.bank.demo.Repository.LedgerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LedgerService {
    @Autowired
     LedgerRepo ledgerRepo;


    public List<Ledger> getAllLedger(){
        return ledgerRepo.findAll();
    }
}
