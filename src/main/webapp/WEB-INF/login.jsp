<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Lora', serif;
        }
        .container {
            width: 300px;
            margin: 0 auto;
            margin-top: 50px;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    .custom-submit {
        background-color: #8B4513;
        color: white;
        border: none;
        padding: 10px 20px;
        margin-top: 10px;
        width: 100%;
        border-radius: 4px;
        cursor: pointer;
    }
    .custom-submit:hover {
        background-color: #A0522D;
    }
    </style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
    <div class="container">
        <h2>Login Test</h2>
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>        
        <form action="logingin" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" class="btn custom-submit" value="Login">
        </form>
    </div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>        
</body>
</html>
