package com.bank.demo.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

import java.util.List;


@Component
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity

@JsonIgnoreProperties({"ledger", "accountDetailList"})
public class AccountType {
    @Id
    private String AccTypId;

    private  String AccTyp;

@OneToMany(mappedBy = "accountType" , cascade = CascadeType.ALL)
 //@JsonManagedReference
    private List<AccountDetail> accountDetailList = new ArrayList<>();


    @OneToOne(mappedBy = "accountType",cascade = CascadeType.ALL)
	@JsonBackReference
    private Ledger ledger;


	public String getAccTypId() {
		return AccTypId;
	}


	public void setAccTypId(String accTypId) {
		AccTypId = accTypId;
	}


	public String getAccTyp() {
		return AccTyp;
	}


	public void setAccTyp(String accTyp) {
		AccTyp = accTyp;
	}


	public List<AccountDetail> getAccountDetailList() {
		return accountDetailList;
	}


	public void setAccountDetailList(List<AccountDetail> accountDetailList) {
		this.accountDetailList = accountDetailList;
	}


	public Ledger getLedger() {
		return ledger;
	}


	public void setLedger(Ledger ledger) {
		this.ledger = ledger;
	}



}
