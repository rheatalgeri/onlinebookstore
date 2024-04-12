package com.in6225.spring.onlinebookstore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in6225.spring.onlinebookstore.dao.LoginDao;
import com.in6225.spring.onlinebookstore.model.LoginBean;
//import com.in6225.spring.onlinebookstore.utils.UtilHelper;


@Controller
public class LoginController {

    @Autowired
    private LoginDao loginDao;

    @GetMapping("/logingin")
    public String authenticate(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)&&isAdmin(username,password)) {
            	session.setAttribute("userId", username);
                return "admin/admindashboard";
            } 
            else if(loginDao.validate(loginBean)) 
            {
            	session.setAttribute("userId", username);
            	return "user/userdashboard";
            }
            else 
            {
            	return "login";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;

    }
    
    private boolean isAdmin(String username, String password) {
        String adminUsername = "admin";
        String adminPassword = "admin";
    
        return username.equals(adminUsername) && password.equals(adminPassword);
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); 
        return "login"; 
    }
}

