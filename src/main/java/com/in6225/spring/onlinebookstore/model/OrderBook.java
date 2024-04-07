package com.in6225.spring.onlinebookstore.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="orderbook")
public class OrderBook {

	private Order order;
	private List<Book> booklist;
	
	protected OrderBook() {
		
	}
	
	public OrderBook(Order order, List<Book> booklist) {
		this.order = order;
		this.booklist = booklist;
	}
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<Book> getBooklist() {
		return booklist;
	}

	public void setBooklist(List<Book> booklist) {
		this.booklist = booklist;
	}	
	
}
