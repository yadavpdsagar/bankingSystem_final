package com.bank.demo.Controller;

import com.bank.demo.Model.Ledger;
import com.bank.demo.service.LedgerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class LedgerController {
@Autowired
    private LedgerService ledgerService;

@GetMapping("/admin/getallledger")
    public List<Ledger> ledgerList(){
    return  ledgerService.getAllLedger();
}

}
