package com.bank.demo.DTO;

import com.bank.demo.Model.EmployeeRole;
import com.bank.demo.Model.UserDetail;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserDetialsReqRes {
    private int statusCode;
    private String error;
    private String message;
    private String UserName;
    private String email;
    private EmployeeRole role;
    private String password;
    private  UserDetail userDetail;
    private List<UserDetail> userDetailList;

  private AccountDetailReqRes accountDetailReqRes;

public int getStatusCode() {
	return statusCode;
}

public void setStatusCode(int statusCode) {
	this.statusCode = statusCode;
}

public String getError() {
	return error;
}

public void setError(String error) {
	this.error = error;
}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public String getUserName() {
	return UserName;
}

public void setUserName(String userName) {
	UserName = userName;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public EmployeeRole getRole() {
	return role;
}

public void setRole(EmployeeRole role) {
	this.role = role;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public UserDetail getUserDetail() {
	return userDetail;
}

public void setUserDetail(UserDetail userDetail) {
	this.userDetail = userDetail;
}

public List<UserDetail> getUserDetailList() {
	return userDetailList;
}

public void setUserDetailList(List<UserDetail> userDetailList) {
	this.userDetailList = userDetailList;
}

public AccountDetailReqRes getAccountDetailReqRes() {
	return accountDetailReqRes;
}

public void setAccountDetailReqRes(AccountDetailReqRes accountDetailReqRes) {
	this.accountDetailReqRes = accountDetailReqRes;
}

}
