<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
<style>
    .header-nav {
        margin-bottom: 16px;
    }
    body {
        font-family: 'Lora', serif; 
        background-color: #f4f4f4;
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
<jsp:include page="adminheader.jsp"></jsp:include>
<div class="container form-container">
    <h2 class="text-center">Add New Book</h2>
    <form action="createbook" method="get">
        <input type="text" class="form-control custom-input" name="bookName" placeholder="Book Name" required>
        <input type="text" class="form-control custom-input" name="description" placeholder="Description" required>
        <input type="number" class="form-control custom-input" name="price" step="0.01" min="0" placeholder="Book Price" required>
        <input type="submit" class="btn custom-submit" value="Add Book">
    </form>
</div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
