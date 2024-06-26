<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bookstore - User Created Successfully</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap"
	rel="stylesheet">
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
	color: #8B4513;
}

.centered-link {
	text-align: center;
	display: block;
	color: #8B4513;
	text-decoration: none;
}

.centered-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<h1>Account creation is successful!</h1>
		<p>
			<a href="login.jsp" class="centered-link">You can now login to your account!</a>
		</p>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
