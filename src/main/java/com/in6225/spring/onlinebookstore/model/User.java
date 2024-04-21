package com.in6225.spring.onlinebookstore.model;

import javax.persistence.Entity;
import javax.persistence.Table;
@Entity
@Table(name="users")
public class User {

	private String userId;
	private String password;
	private String email;
	private String contactNo;
	private String name;
	
	public User(String userId, String email, String contactNo, String name) {
		this.userId = userId;
		this.email = email;
		this.contactNo = contactNo;
		this.setName(name);
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String address) {
		this.email = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
