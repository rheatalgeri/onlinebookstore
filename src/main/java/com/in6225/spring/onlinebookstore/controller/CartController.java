package com.in6225.spring.onlinebookstore.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.in6225.spring.onlinebookstore.dao.BookDao;
import com.in6225.spring.onlinebookstore.dao.CartItemDao;
import com.in6225.spring.onlinebookstore.dao.OrderDao;
import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.Cart;
import com.in6225.spring.onlinebookstore.model.CartItem;

@Controller
public class CartController {
    
    @Autowired
    private CartItemDao cartItemDao;   
    
    @Autowired
    private OrderDao orderDao;

    @PostMapping("/addtocart")
    public String addToCart(@RequestParam("bookId") Long bookId, @RequestParam("quantity") int quantity, HttpSession session) {
        String userId = (String) session.getAttribute("userId");

        	if(!cartItemDao.isBookInCart(userId, bookId)) {
        		cartItemDao.addCartItem(userId, bookId, quantity);
        	} else {
        		cartItemDao.updateCartItemQuantity(userId, bookId, quantity);
        	}       	
        	return "redirect:/view";
    }


    @GetMapping("/view")
    public String viewCart(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        List<CartItem> cartItems = cartItemDao.findAllCartItemsByUserId(userId);
        model.addAttribute("cartItems", cartItems);
        return "user/cart";
    }
    

    @PostMapping("/deleteitem")
    public String deleteCartItem(@RequestParam("bookId") Long bookId, HttpSession session) {
    	String userId = (String) session.getAttribute("userId");
    	cartItemDao.deleteCartItem(userId, bookId);
        return "redirect:/view";
        
    }
    
    @PostMapping("/updatecart")
    public String updateCart(@RequestParam("bookId") Long bookId, @RequestParam("quantity") int quantity, HttpSession session) {
        String userId = (String) session.getAttribute("userId");

        	if(!cartItemDao.isBookInCart(userId, bookId)) {
        		cartItemDao.addCartItem(userId, bookId, quantity);
        	} else {
        		cartItemDao.updateCartItemQuantity(userId, bookId, quantity);
        	}       	
        	return "user/cart";
    }
    
    @PostMapping("/checkout")
    public String checkout(HttpSession session) throws SQLException {
    	String userId = (String) session.getAttribute("userId");
    	orderDao.createOrderFromCart(userId);
    	cartItemDao.clearCartByUserId(userId);
    	return "user/orderconfirmation";
    }
    
}    

