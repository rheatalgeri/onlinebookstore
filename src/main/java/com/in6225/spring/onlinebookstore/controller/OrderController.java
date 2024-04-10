package com.in6225.spring.onlinebookstore.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.in6225.spring.onlinebookstore.dao.BookDao;
import com.in6225.spring.onlinebookstore.dao.OrderDao;
import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.Order;
import com.in6225.spring.onlinebookstore.utils.UtilHelper;

@Controller
public class OrderController {
	@Autowired
    private OrderDao orderDAO;

    @GetMapping("/getallorders")
    private String listAllBooks(Model model)
            throws SQLException, IOException, ServletException {
        List<Order> orderList = orderDAO.getAllOrders();
        model.addAttribute("orderlist", orderList);
        return "admin/listorders";
    }
    
    @PostMapping("/cart/orderconfirmation")
    private String orderConfirmation(@RequestParam("amount") Double amount,  @RequestParam("booklist") String booklist, HttpSession session) {
    	try {
    		String userId = (String) session.getAttribute("userId");
    		System.out.println(booklist);
    		System.out.println(userId+" "+amount);
//	        orderDAO.insertOrder(amount, userId, booklist);    
	        return "user/orderconfirmation";
    	
    	} catch (Exception e) {
    		
    		return "user/orderfailure";
    	}
    }

}
