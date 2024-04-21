<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Order List</title>
<link
	href="https://fonts.googleapis.com/css?family=Merriweather|Montserrat:400,700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Lora', serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

h1, h2, h3 {
	font-family: 'Lora', serif;
	color: #5D4037;
}

.order-table, .book-table {
	width: 90%;
	margin: 20px auto;
	border-collapse: collapse;
}

.order-table th, .order-table td, .book-table th, .book-table td {
	border: 1px solid #ccc;
	padding: 12px;
	text-align: left;
}

.book-table th {
	background-color: #E0E0E0;
}

.order-header {
	background-color: #C8E6C9;
	padding: 15px;
	margin-top: 20px;
	border-radius: 5px;
}

table {
	background-color: white;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.total-row {
	font-weight: bold;
	background-color: #B2DFDB;
}
</style>
</head>
<body>
	<jsp:include page="adminheader.jsp"></jsp:include>
	<h1>List of Orders</h1>
	<c:forEach var="order" items="${orders}">
		<div class="order-header">
			<h2>Order ID: ${order.orderId} - User ID: ${order.userId}</h2>
			<div>Amount: $${order.amount}</div>
			<div>
				Date:
				<c:out value="${order.createDateTime}" />
			</div>
		</div>
		<table class="book-table">
			<thead>
				<tr>
					<th>Book ID</th>
					<th>Title</th>
					<th>Price</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${order.bookList}">
					<tr>
						<td>${book.bookId}</td>
						<td>${book.name}</td>
						<td>$${book.price}</td>
						<td>${book.description}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:forEach>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
