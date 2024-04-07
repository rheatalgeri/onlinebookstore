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
            <a class="navbar-brand" href="/Bookstore">
                <img src="your-book-icon.svg" alt="Bookstore Logo" width="30" height="24" class="d-inline-block align-text-top">
                Bookstore
            </a>
            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="/Bookstore">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/genres">Genres</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getbestsellers">Best Sellers</a></li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/login.jsp" class="nav-link">Login</a>
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
