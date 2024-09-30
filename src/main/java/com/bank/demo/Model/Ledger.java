package com.bank.demo.Model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Ledger {
    @Id
    private int ledgerId;

    @OneToOne
	@JsonManagedReference
    private AccountType accountType;

    private Long TotalAmount;
    

	public int getLedgerId() {
		return ledgerId;
	}

	public void setLedgerId(int ledgerId) {
		this.ledgerId = ledgerId;
	}

	public AccountType getAccountType() {
		return accountType;
	}

	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

	public Long getTotalAmount() {
		return TotalAmount;
	}

	public void setTotalAmount(Long totalAmount) {
		TotalAmount = totalAmount;
	}
    

}
