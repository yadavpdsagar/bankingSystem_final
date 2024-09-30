package com.bank.demo.Repository;

import com.bank.demo.Model.AccountDetail;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import java.util.Optional;

@Repository
public interface AccountDetialsRepo extends JpaRepository<AccountDetail,String> {

    Optional<AccountDetail> findByaccountNumber(String accountNumber  );



}
