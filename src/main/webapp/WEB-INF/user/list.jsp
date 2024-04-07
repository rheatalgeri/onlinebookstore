<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookstore - List of Books</title>
    <!-- Include Bootstrap CSS and Google Fonts for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Lora', serif; /* Bookstore theme font */
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #8B4513; /* Deep brown for the bookstore theme */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #8B4513; /* Deep brown header */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        /* Styling for the cart button */
        .btn-primary {
            background-color: #8B4513;
            border: none;
        }
        /* Include font-awesome for icons */
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css');
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include> <!-- Assuming header.jsp is in the same directory -->
    <div class="container">
        <h1>List of Books</h1>
        <table class="table"> <!-- Bootstrap class added -->
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Action</th> <!-- Added header cell for the action column -->
                </tr>
            </thead>
		    <tbody>
		        <c:forEach var="book" items="${booklist}">
		            <tr>
		                <td>${book.bookId}</td>
		                <td>${book.name}</td>
		                <td>${book.description}</td>
		                <td><fmt:formatNumber value="${book.price}" pattern="#,##0.00"/></td>
		                <td> 
		                    <form action="addToCart" method="post">
		                        <input type="hidden" name="bookId" value="${book.bookId}">
		                        <!-- Updated button with Bootstrap classes -->
		                        <button type="submit" class="btn btn-primary btn-sm">
		                            <i class="fas fa-shopping-cart"></i> Add to Cart
		                        </button>
		                    </form>
		                </td>
		            </tr>
		        </c:forEach>
		    </tbody>
        </table>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include> <!-- Adjust the path as needed -->
</body>
</html>