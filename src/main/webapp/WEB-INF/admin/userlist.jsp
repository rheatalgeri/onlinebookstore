<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
            color: #333;
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
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
	<jsp:include page="adminheader.jsp"></jsp:include>
    <div class="container">
        <h1>List of User</h1>
        <table>
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>Phone Number</th>
                    <th>Email Address</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through each book in the bookList -->
                <c:forEach var="user" items="${userlist}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.contactNo}</td>
                        <td>${user.email}</td>
                        <td>${user.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>    
</body>
</html>
