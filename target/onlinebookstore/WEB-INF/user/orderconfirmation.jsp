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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Lora', serif;
        }
        .container {
            margin-top: 50px;
            text-align: center;
        }
        h1 {
            color: #8B4513;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h1>Order Confirmed</h1>
        <p>Your order has been successfully confirmed. Thank you for shopping with us! Unfortunately only payment on pick up is available currently.</p>
        <a href="<%=request.getContextPath()%>/backtouserdashboard">Go back to Home</a>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
