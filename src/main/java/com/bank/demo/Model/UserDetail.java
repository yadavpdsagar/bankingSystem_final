package com.bank.demo.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;


@Getter
@Component
@Entity
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer UserId;
    private String username;
   private  String email;
    private String Password;

    @Enumerated(EnumType.STRING  )
    private EmployeeRole role;

	public Integer getUserId() {
		return UserId;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return Password;
	}

	public EmployeeRole getRole() {
		return role;
	}

	public void setUserId(Integer userId) {
		UserId = userId;
	}

    public void setUsername(String username) {
		this.username = username;
	}

    public void setEmail(String email) {
		this.email = email;
	}

    public void setPassword(String password) {
		Password = password;
	}

    public void setRole(EmployeeRole role) {
		this.role = role;
	}








    }


