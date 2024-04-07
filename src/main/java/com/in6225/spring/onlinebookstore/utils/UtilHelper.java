package com.in6225.spring.onlinebookstore.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component
public class UtilHelper {

    public static Boolean isEmpty(String str) {
        return str == null || str.isEmpty() || str.trim().isEmpty() || str.trim().equals("null");
    }

    public static Boolean isLoggedIn(HttpServletRequest request) {
        String val = getCookieValue(request, "username");
        return !isEmpty(val);
    }

    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return "";
        }
        for (Cookie c : cookies) {
            String tname = c.getName();
            if (tname.equals(name)) {
                return c.getValue();
            }
        }
        return "";
    }

    public static void clearCookie(HttpServletRequest request, HttpServletResponse response, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return;
        }
        for (Cookie c : cookies) {
            String tname = c.getName();
            if (tname.equals(name)) {
                c.setValue("");
                c.setPath("/");
                c.setMaxAge(0);
                response.addCookie(c);
            }
        }
    }
}
