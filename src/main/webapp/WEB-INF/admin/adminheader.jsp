<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bookstore Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Include Bootstrap CSS from CDN and a Google Font that fits a bookstore theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
<style>
    .header-nav {
        margin-bottom: 16px;
    }
    body {
        font-family: 'Lora', serif; /* This is a font that gives a more traditional book printing look */
    }
    .navbar {
        background-color: #8B4513; /* A deep brown color reminiscent of book leather */
    }
    .navbar-brand, .nav-link {
        color: #FFF8DC !important; /* A light creamy color for text to stand out */
    }
</style>
</head>
<body>

<header class="header-nav">
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/backtoadmindashboard">
                <img src="<%=request.getContextPath()%>/resources/book.svg" alt="Book Icon">
                Bookstore
            </a>
            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
					    <a class="nav-link" href="#" onclick="document.getElementById('getOrdersForm').submit()">Orders</a>
					    <form id="getOrdersForm" action="getallorders" method="get" style="display: none;"></form>
					</li>
					<li class="nav-item">
					    <a class="nav-link" href="#" onclick="document.getElementById('getBooksForm').submit()">Books</a>
					    <form id="getBooksForm" action="getallbooks" method="get" style="display: none;"></form>
					</li>
					<li class="nav-item">
					    <a class="nav-link" href="#" onclick="document.getElementById('getUsersForm').submit()">Users</a>
					    <form id="getUsersForm" action="getallusers" method="get" style="display: none;"></form>
					</li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="login.jsp" class="nav-link">Logout</a>
                    </li>     
                </ul>           
            </div>
        </div>
    </nav>
</header>

<!-- Include Bootstrap JS and its dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
