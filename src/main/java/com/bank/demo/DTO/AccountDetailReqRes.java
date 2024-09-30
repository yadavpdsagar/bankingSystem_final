package com.bank.demo.DTO;

import com.bank.demo.Model.AccountDetail;


import com.bank.demo.Model.AccountType;
import com.bank.demo.Model.TransactionDetail;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccountDetailReqRes {
    private int statusCode;
    private String error;
    private String message;
    private String accountNumber;
    private String Name;
    private Long balance;
    private String Address;
    private AccountType accountType;
    private AccountDetail accountDetail;

    private List<AccountDetailReqRes> accountDetailReqResList;


    private List<TransactionDetail> transactionDetail = new ArrayList<>();


}
