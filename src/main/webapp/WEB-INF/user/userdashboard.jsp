<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        body {
            font-family: 'Lora', serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        h3 {
            color: #666;
        }
            .navbar {
        background-color: #8B4513; 
    }
    .navbar-brand, .nav-link {
        color: #FFF8DC !important; 
    }
	    .form-container {
	        max-width: 400px;
	        padding: 30px; 
	        margin: auto;
	        margin-top: 50px;
	        background-color: white;
	        border-radius: 8px;
	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	    }
	    .custom-input {
	        margin-bottom: 10px;
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
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h2>Welcome to Your Dashboard, ${sessionScope.userId}!</h2>

        <div class="container form-container">
        <form action="listbystring" method="get" class="search-form">
            <input type="text" name="searchString" placeholder="Search for books...">
            <button class="btn custom-submit" type="submit">Search</button>
        </form>
        </div>
        
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
