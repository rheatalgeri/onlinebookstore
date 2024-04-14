package com.in6225.spring.onlinebookstore.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="orderbook")
public class OrderBook {

	private Long orderId;
	private Long bookId;
	private int quantity;
	
	protected OrderBook() {
		
	}
	
	public OrderBook(Long orderId, Long bookId, int quantity) {
		this.bookId = bookId;
		this.orderId = orderId;
		this.quantity = quantity;
	}

	public OrderBook(Long bookId, int quantity) {
		this.bookId = bookId;
		this.quantity = quantity;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
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
	

	
}
