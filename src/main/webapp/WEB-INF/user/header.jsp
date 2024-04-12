<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bookstore Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<script src=”https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js”></script> 
<script src=”https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js”> </script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<style>
    .header-nav {
        margin-bottom: 16px;
    }
    body {
        font-family: 'Lora', serif; 
    }
    .navbar {
        background-color: #8B4513; 
    }
    .navbar-brand, .nav-link {
        color: #FFF8DC !important; 
    }
    span {
    	color: #FFF8DC
    }
</style>
</head>
<body>

<header class="header-nav">
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/backtouserdashboard">
                <img src="<%=request.getContextPath()%>/resources/book.svg" alt="Book Icon">
                Bookstore
            </a>
            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/backtouserdashboard">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/userorders">Genres</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getbestsellers">Best Sellers</a></li>
				    <li class="nav-item">
				        <a href="<%=request.getContextPath()%>/cart/view" class="nav-link"><i class="fas fa-shopping-cart"></i> Cart</a>
				    </li>
				</ul>   
                </ul>                 
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/logout" class="nav-link">Logout</a>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
