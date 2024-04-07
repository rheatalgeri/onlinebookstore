package com.in6225.spring.onlinebookstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book {
	
	@Id
	private Long bookId;
	private String name;
	private String description;
	private Double price;
	
	protected Book() {
		
	}

	public Book(Long bookId, String name, Double price) {
		super();
		this.bookId = bookId;
		this.name = name;
		this.price = price;
	}

	public Book(String name, double price, String description) {
        super();
        this.name = name;
        this.price = price;
        this.description = description;
    }
	
	public Book(Long bookId, String name, double price, String description) {
        super();
        this.bookId = bookId;
        this.name = name;
        this.price = price;
        this.description = description;
    }

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}
	
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
    
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (bookId != other.bookId)
			return false;
		return true;
	}





}
