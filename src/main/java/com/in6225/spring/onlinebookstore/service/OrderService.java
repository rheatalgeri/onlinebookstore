package com.in6225.spring.onlinebookstore.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.in6225.spring.onlinebookstore.dao.CartItemDao;
import com.in6225.spring.onlinebookstore.dao.OrderDao;
import com.in6225.spring.onlinebookstore.model.CartItem;
import com.in6225.spring.onlinebookstore.model.OrderBook;

import java.util.List;
import java.util.ArrayList;

@Service
public class OrderService {

    private final CartItemDao cartItemDao;
    private final OrderDao orderDao;

    public OrderService(CartItemDao cartItemDao, OrderDao orderDao) {
        this.cartItemDao = cartItemDao;
        this.orderDao = orderDao;
    }

    @Transactional
    public Long checkout(String userId) throws Exception {
        List<CartItem> cartItems = cartItemDao.findAllCartItemsByUserId(userId);
        if (cartItems.isEmpty()) {
            throw new Exception("No items in cart");
        }

        List<OrderBook> orderBooks = convertCartItemsToOrderBooks(cartItems);
        double totalAmount = calculateTotalAmount(cartItems);
        
        Long orderId = orderDao.insertOrder(totalAmount, userId, orderBooks);
        cartItemDao.clearCartByUserId(userId);
        return orderId;
    }

    private List<OrderBook> convertCartItemsToOrderBooks(List<CartItem> cartItems) {
        List<OrderBook> orderBooks = new ArrayList<>();
        for (CartItem item : cartItems) {
            OrderBook orderBook = new OrderBook(item.getBookId(), item.getQuantity());
            orderBooks.add(orderBook);
        }
        return orderBooks;
    }

    private double calculateTotalAmount(List<CartItem> cartItems) {
        return cartItems.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
    }
}
