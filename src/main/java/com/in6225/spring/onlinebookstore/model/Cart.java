package com.in6225.spring.onlinebookstore.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class Cart {

    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }


    public void addItem(CartItem item) {
        items.add(item);
    }
    
    public void removeFromCart(Long bookId) {
        Iterator<CartItem> iterator = items.iterator();
        while (iterator.hasNext()) {
            CartItem cartItem = iterator.next();
            if (cartItem.getBookId().equals(bookId)) { 
                iterator.remove();
            }
        }
    }

}
