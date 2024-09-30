package com.bank.demo.service;

import com.bank.demo.DTO.AccountDetailReqRes;
import com.bank.demo.Model.AccountDetail;
import com.bank.demo.Model.AccountType;
import com.bank.demo.Model.Ledger;
import com.bank.demo.Model.UserDetail;
import com.bank.demo.Repository.AccountDetialsRepo;
import com.bank.demo.Repository.AccountTypeRepo;
import com.bank.demo.Repository.LedgerRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.Optional;



@Component
@Service

public class AccountDetialsService {
    @Autowired
    private AccountDetialsRepo accountDetialsRepo;

    @Autowired
    private AccountTypeRepo accountTypeRepo;

@Autowired
    LedgerRepo ledgerRepo;

    public AccountDetail AccountRegistration(AccountDetail accountDetail, String accTypId) {
        Optional<AccountType> accountTypeOptional = accountTypeRepo.findById(accTypId);
        if (accountTypeOptional.isPresent()) {
            AccountType accountType = accountTypeOptional.get();
            accountDetail.setAccountType(accountType);
            Ledger ledger = ledgerRepo.findById(accountType.getLedger().getLedgerId()).orElseThrow(()-> new RuntimeException("ledger not found"));
            ledger.setTotalAmount(ledger.getTotalAmount()+accountDetail.getBalance());

        } else {
            throw new RuntimeException("Account Type not found");
        }

        return accountDetialsRepo.save(accountDetail);
    }
    
    
  public List<AccountDetail> getAccountDetails(){
	  return accountDetialsRepo.findAll();
  }
    


    
   
}
