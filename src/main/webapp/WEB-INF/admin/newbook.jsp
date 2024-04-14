<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Include Bootstrap CSS from CDN and a Google Font that fits a bookstore theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
<style>
    .header-nav {
        margin-bottom: 16px;
    }
    body {
        font-family: 'Lora', serif; 
        background-color: #f4f4f4; /* soft background color */
    }
    .navbar {
        background-color: #8B4513; 
    }
    .navbar-brand, .nav-link {
        color: #FFF8DC !important; 
    }
    .form-container {
        max-width: 400px; /* Fixed width for larger screens */
        padding: 30px; 
        margin: auto; /* Center the form on the page */
        margin-top: 50px; /* Add some top margin for aesthetics */
        background-color: white; /* Background color for the form */
        border-radius: 8px; /* Rounded corners for the form */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
    }
    .custom-input {
        margin-bottom: 10px; /* Space out the inputs */
    }
    .custom-submit {
        background-color: #8B4513; /* Button color to match navbar */
        color: white;
        border: none;
        padding: 10px 20px; /* Larger button padding */
        margin-top: 10px; /* Space above the button */
        width: 100%; /* Full-width button */
        border-radius: 4px; /* Match the form border radius */
        cursor: pointer;
    }
    .custom-submit:hover {
        background-color: #A0522D; /* Slightly darker on hover */
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
