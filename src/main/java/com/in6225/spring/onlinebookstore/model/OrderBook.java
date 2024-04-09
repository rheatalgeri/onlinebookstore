package com.in6225.spring.onlinebookstore.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="orderbook")
public class OrderBook {

	private Long orderId;
	private Long bookId;
	private int bookQuantity;
	
	protected OrderBook() {
		
	}
	
	public OrderBook(Long orderId, Long bookId, int bookQuantity) {
		this.bookId = bookId;
		this.orderId = orderId;
		this.bookQuantity = bookQuantity;
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

	public int getBookQuantity() {
		return bookQuantity;
	}

	public void setBookQuantity(int bookQuantity) {
		this.bookQuantity = bookQuantity;
	}
	

	
}
