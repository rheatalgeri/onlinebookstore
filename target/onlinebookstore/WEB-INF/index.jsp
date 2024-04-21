<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to the Online Bookstore</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
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

.login-link {
	display: block;
	text-align: center;
	margin-bottom: 20px;
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.login-link:hover {
	text-decoration: underline;
}

.search-form {
	text-align: center;
	margin-top: 20px;
}

.search-form input[type="text"] {
	padding: 10px;
	width: 60%;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.custom-input {
	margin-bottom: 10px;
}

.custom-submit {
	background-color: #B37A4C;
	color: #B37A4C
	padding: 10px 20px;
	margin-top: 10px;
	width: 100%;
	cursor: pointer;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.custom-submit:hover {
	background-color: #A0522D;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container">
		<h1>Welcome to the Online Bookstore</h1>
		<form action="listbystring" method="get" class="search-form">
			<input type="text" name="searchString"
				placeholder="Search for books...">
			<button class="btn custom-submit" type="submit">Search</button>
		</form>
	</div>
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>
