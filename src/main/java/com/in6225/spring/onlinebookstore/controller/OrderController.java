package com.in6225.spring.onlinebookstore.controller;

import java.io.IOException;
import java.sql.SQLException;
//import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;


import com.in6225.spring.onlinebookstore.model.OrderBook;
//import com.in6225.spring.onlinebookstore.dao.BookDao;
import com.in6225.spring.onlinebookstore.dao.OrderDao;
//import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.Order;
//import com.in6225.spring.onlinebookstore.utils.UtilHelper;

@Controller
public class OrderController {
	@Autowired
    private OrderDao orderDAO;

    @GetMapping("/getallorders")
    private String listAllBooks(Model model)
            throws SQLException, IOException, ServletException {
        List<Order> orders = orderDAO.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/listorders";
    }
    
    @PostMapping("/cart/orderconfirmation")
    private ResponseEntity<String> orderConfirmation(@RequestParam("amount") Double amount, @RequestParam("booklist") String booklistEncoded, HttpSession session) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            String booklistJson = java.net.URLDecoder.decode(booklistEncoded, "UTF-8");
            List<OrderBook> booklist = mapper.readValue(booklistJson, new TypeReference<List<OrderBook>>() {});

            String userId = (String) session.getAttribute("userId");
            Long orderId = orderDAO.insertOrder(amount, userId, booklist);
            return ResponseEntity.ok("Order confirmed with ID: " + orderId);
        } catch (Exception e) {
            e.printStackTrace(); // This will help log what went wrong
            return ResponseEntity.badRequest().body("Order processing failed due to: " + e.getMessage());
        }
    }
    
    @GetMapping("/userorders")
    private String userOrders(Model model, HttpSession session)
            throws SQLException, IOException, ServletException {
    	String userId = (String) session.getAttribute("userId");
        List<Order> orders = orderDAO.getOrdersByUser(userId);
        model.addAttribute("orders", orders);
        return "user/listorders";
    }

}






