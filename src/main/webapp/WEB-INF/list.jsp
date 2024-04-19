<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookstore - List of Books</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
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
            background-color: #8B4513;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .btn-primary {
            background-color: #8B4513;
            border: none;
        }
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css');
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h1>List of Books</h1>
         <div class="response-message" style="display: none; color: green; text-align: center; margin-bottom: 20px;"></div>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Price</th>
                </tr>
            </thead>
				<tbody>
				    <c:forEach var="book" items="${booklist}">
				    
					        <tr>
					        
					            <td>${book.bookId}</td>
					            <td><a href="${pageContext.request.contextPath}/viewbook?bookId=${book.bookId}" style="text-decoration: none; color: inherit;">
					            ${book.name} </a></td>
					            <td>${book.description}</td>
					            <td><fmt:formatNumber value="${book.price}" pattern="#,##0.00"/></td>
					            
					        </tr>
				        
				    </c:forEach>
				    
				</tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>    
<script>
$(document).ready(function() {
    $('.add-to-cart-form').on('submit', function(e) {
        e.preventDefault();

        var $form = $(this);
        var formData = $form.serialize();

        $.ajax({
            type: 'POST',
            url: $form.attr('action'),
            data: formData,
            success: function(response) {
                // Display the response message and ensure it is visible
                var $responseMessage = $('.response-message');
                $responseMessage.text('Item added to cart').css({
                    'display': 'block',
                    'color': 'green'  // Optional: Change color based on success
                });

                // Hide the message after 2000 milliseconds (2 seconds)
                setTimeout(function() {
                    $responseMessage.fadeOut();  // Using fadeOut for a smooth disappearance
                }, 2000);
            },
            error: function() {
                console.error('Failed to add item to cart');
                // Display error message
                $('.response-message').text('Failed to add item to cart').css({
                    'display': 'block',
                    'color': 'red'  // Optional: Change color based on error
                });
            }
        });
    });
});
</script>
  
</body>
</html>
