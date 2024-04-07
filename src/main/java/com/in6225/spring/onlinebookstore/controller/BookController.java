package com.in6225.spring.onlinebookstore.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.in6225.spring.onlinebookstore.dao.BookDao;
import com.in6225.spring.onlinebookstore.model.Book;

@Controller
public class BookController {
	@Autowired
	private BookDao bookDAO;
	
	@RequestMapping("/onlinebs/listbystring")
	public String showRegistrationPage() {
		return "list";
	}
	
    @GetMapping("/listbystring")
    private String filterBooksBasedOnString(@RequestParam("searchString") String searchString, Model model) {
        System.out.println("inside filter method in bookcontroller");
        List<Book> filteredBooks = bookDAO.searchBySubstring(searchString);
        model.addAttribute("booklist", filteredBooks);
        return "user/list";
    }
    
    // admin method
    @GetMapping("/getallbooks")
    private String listAllBooks(Model model)
            throws SQLException, IOException, ServletException {
        List<Book> booklist = bookDAO.getAllBooks();
        model.addAttribute("booklist", booklist);
        return "admin/list";
    }
    
    @GetMapping("/getbestsellers")
    private String getBestSellers(Model model)
            throws SQLException, IOException, ServletException {
        List<Book> bookList = bookDAO.getAllBooks();
        model.addAttribute("booklist", bookList);
        return "bestsellers";
    }
 
}