<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.in6225.spring.onlinebookstore.model.Cart" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <!-- Include Bootstrap CSS from CDN and a Google Font that fits a bookstore theme -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Lora', serif; /* This is a font that gives a more traditional book printing look */
        }
        .container {
            margin-top: 50px;
            text-align: center;
        }
        h1 {
            color: #8B4513; /* A deep brown color reminiscent of book leather */
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h1>Order Confirmed</h1>
        <p>Your order has been successfully confirmed. Thank you for shopping with us!</p>
        <a href="<%=request.getContextPath()%>/">Go back to Home</a>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
