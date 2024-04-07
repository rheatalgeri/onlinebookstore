package com.in6225.spring.onlinebookstore.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="order")
public class Order {
	
	@Id
    private Long orderId;
    private List<Book> bookList;
    private Double amount;
    private Date createDatetime;
    private String userId;

    
	public Order(List<Book> bookList, double amount) {
        this.amount = amount;
        this.bookList = bookList;
    }

    public Order(Long orderId,  List<Book> bookList, Double amount, Date createDatetime, String userId) {
        this.orderId = orderId;
        this.bookList = bookList;
        this.amount = amount;
        this.createDatetime = createDatetime;
        this.userId = userId;
    }
    
    public Order(List<Book> bookList, Double amount, Date createDatetime, String userId) {
        this.bookList = bookList;
        this.amount = amount;
        this.createDatetime = createDatetime;
        this.userId = userId;
    }
    protected Order() {

    }


	public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }


    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Order other = (Order) obj;
        if (orderId != other.orderId)
            return false;
        return true;
    }

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	
    public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
