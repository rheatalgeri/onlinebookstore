package com.in6225.spring.onlinebookstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cartitem")
public class CartItem {

	private String userId;
	private Long bookId;
	private String bookName;
    private int quantity;	
	private double price;
	
	public CartItem(Long bookId, int quantity, String bookName, Double price) {
		this.bookId = bookId;
		this.quantity = quantity;
		this.setBookName(bookName);
		this.price = price;
	}

	public Long getBookId() {
		return bookId;
	}
	
	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
}
