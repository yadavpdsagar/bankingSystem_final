package com.bank.demo.Repository;

import com.bank.demo.Model.AccountType;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountTypeRepo extends JpaRepository<AccountType,String > {
    @Override
    Optional<AccountType> findById(String AccTypId);
}


