package com.bank.demo.Model;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class TransactionDetail {

@Id
@GeneratedValue
    private  Integer TransactionId;
 private  String name;

    @Enumerated(EnumType.STRING)
private TransactionType transactionType;

    private Long TransactionAmount;

    @ManyToOne
    @JoinColumn(name = "accountNumber")
	//@JsonBackReference
    private AccountDetail accountDetail;

	public Integer getTransactionId() {
		return TransactionId;
	}

	public void setTransactionId(Integer transactionId) {
		TransactionId = transactionId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public TransactionType getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(TransactionType transactionType) {
		this.transactionType = transactionType;
	}

	public Long getTransactionAmount() {
		return TransactionAmount;
	}

	public void setTransactionAmount(Long transactionAmount) {
		TransactionAmount = transactionAmount;
	}

	public AccountDetail getAccountDetail() {
		return accountDetail;
	}

	public void setAccountDetail(AccountDetail accountDetail) {
		this.accountDetail = accountDetail;
	}






}
