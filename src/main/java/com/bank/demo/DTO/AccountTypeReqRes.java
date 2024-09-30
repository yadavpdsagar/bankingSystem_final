package com.bank.demo.DTO;

import com.bank.demo.Model.AccountDetail;
import com.bank.demo.Model.Ledger;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.CascadeType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccountTypeReqRes {
    private String AccTypId;

    private  String AccTyp;


    private List<AccountDetail> accountDetailList = new ArrayList<>();



    private Ledger ledger;
}
