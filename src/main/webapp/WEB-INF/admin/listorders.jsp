<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order List</title>
    <style>
        .order-table, .book-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .order-table th, .order-table td, .book-table th, .book-table td {
            border: 1px solid black;
            padding: 8px;
        }
        .book-table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<jsp:include page="adminheader.jsp"></jsp:include> 
    <h2>List of Orders</h2>
    <c:forEach var="order" items="${orders}">
        <h3>Order ID: ${order.orderId} - User ID: ${order.userId}</h3>
        <div>Amount: ${order.amount}</div>
        <div>Date: ${order.createDateTime}</div>
        <table class="book-table">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${order.books}">
                    <tr>
                        <td>${book.bookId}</td>
                        <td>${book.name}</td>
                        <td>${book.price}</td>
                        <td>${book.description}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:forEach>
<jsp:include page="../footer.jsp"></jsp:include>    
</body>
</html>
