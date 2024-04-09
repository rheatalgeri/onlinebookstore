package com.in6225.spring.onlinebookstore.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.UUID;
import java.text.ParseException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.in6225.spring.onlinebookstore.dao.BookDao;
import com.in6225.spring.onlinebookstore.dao.OrderDao;
import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.Cart;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private BookDao bookDAO;
	@Autowired
	private OrderDao orderDAO;
	
	
	
	public void init() {
		bookDAO = new BookDao();
		orderDAO = new OrderDao();
	}	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("cart/cart.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		try {
		    Map<String, Object> requestData = new Gson().fromJson(request.getReader(), Map.class);
		    Long orderId = insertOrder(requestData);


            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(orderId.toString());
		} catch (SQLException | ParseException ex) {
			throw new ServletException(ex);
		}
	}
		
		private Long insertOrder(Map<String, Object> requestData) throws SQLException, IOException, ParseException {			
	        try {
	            Double amount = Double.parseDouble(String.valueOf(requestData.get("amount")));
	            String userId = requestData.get("userId").toString();
	            List<Book> booklist = (List<Book>) requestData.get("booklist");
	            Long orderId = orderDAO.insertOrder(amount, userId, booklist);
	            return orderId;
	        } catch (NumberFormatException | SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	            
		}
		
						


}

