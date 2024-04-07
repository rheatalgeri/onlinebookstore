<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Best Sellers</title>
    <style>
        /* Your CSS styles here */
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Best Sellers</h2>
    <table>
        <thead>
            <tr>
                <th>Book ID</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bookId" items="${bestSellers}">
                <tr>
                    <td>${bookId}</td>
                    <!-- Add more columns as needed -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
