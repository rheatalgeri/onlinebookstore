package com.in6225.spring.onlinebookstore.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.in6225.spring.onlinebookstore.model.OrderBook;
import com.in6225.spring.onlinebookstore.dao.OrderDao;
import com.in6225.spring.onlinebookstore.model.Order;

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

    @GetMapping("/userorders")
    private String userOrders(Model model, HttpSession session)
            throws SQLException, IOException, ServletException {
        String userId = (String) session.getAttribute("userId");
        List<Order> orders = orderDAO.getOrdersByUser(userId);
        model.addAttribute("orders", orders);
        return "user/listorders";
    }

}
