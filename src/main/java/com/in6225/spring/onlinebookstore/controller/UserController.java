package com.in6225.spring.onlinebookstore.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.in6225.spring.onlinebookstore.dao.UserDao;
import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.LoginBean;
import com.in6225.spring.onlinebookstore.model.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@GetMapping("/backtouserdashboard")
	public String returnToDashBoard() {
		return "user/userdashboard";
	}
	
	@GetMapping("/backtoadmindashboard")
	public String returnToAdminDashBoard() {
		return "admin/admindashboard";
	}	
	
	@PostMapping("/createuser")
    public String createUser(@RequestParam("userId") String userId, @RequestParam("password") String password, @RequestParam("contactNo") String contactNo, @RequestParam("email") String email, @RequestParam("name") String name ) {
		try {
			userDao.createUser(userId, password, contactNo, email, name);
			return "user/usercreatesuccess";
			
		} catch (Exception e) {
			return "user/usercreatefailure";
		}
    }
	
    // admin method
    @GetMapping("/getallusers")
    private String listAllBooks(Model model)
            throws SQLException, IOException, ServletException {
        List<User> userlist = userDao.getAllUsers();
        model.addAttribute("userlist", userlist);
        return "admin/userlist";
    }
    
    @PostMapping("/deleteuser")
    public String deleteCartItem(@RequestParam("userId") String userId) {
    	System.out.println(userId);
    	userDao.deleteUser(userId);
        return "redirect:/getallusers";
        
    }
}

