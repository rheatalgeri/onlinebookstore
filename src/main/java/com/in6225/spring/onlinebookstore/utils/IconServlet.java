package com.in6225.spring.onlinebookstore.utils;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/iconServlet")
public class IconServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the input stream of the icon file
        InputStream inputStream = getServletContext().getResourceAsStream("/WEB-INF/your-book-icon.png");

        // Set content type
        response.setContentType("image/png");

        // Stream the file to the response
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            response.getOutputStream().write(buffer, 0, bytesRead);
        }
        inputStream.close();
    }
}