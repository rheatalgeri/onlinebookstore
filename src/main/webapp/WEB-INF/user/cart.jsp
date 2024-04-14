<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.in6225.spring.onlinebookstore.model.CartItem"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.util.List"%> <!-- Ensure this is added if you are using lists -->

<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script> <!-- For the trash icon -->
<style>

.container {
    background-color: #fff; /* Keeping inner container white for contrast */
}

.row {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 10px;
}

.col {
    padding: 10px;
    flex: 1;
}

.table {
    border-collapse: collapse;
    width: 100%;
}

.table th, .table td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #decba4; /* Light brown border */
}

.table th {
    background-color: #8b4513; /* Saddle brown */
    color: white;
}

.btn-primary {
    background-color: #6b4f39; /* Dark brown */
    border: none;
}

.btn-primary:hover {
    background-color: #563a2c; /* Darker shade for hover */
}

.btn-danger {
    background-color: red;
    border-color: red;
}

.btn-danger:hover {
    background-color: darkred; /* Darker red on hover */
}

.btn-success {
    background-color: #4caf50; /* Green for success actions like checkout */
    border-color: #4caf50;
}

.btn-success:hover {
    background-color: #43a047; /* Darker green on hover */
}

.alert-info {
    background-color: #f4e8d4; /* Very light brown */
    color: #8b4513; /* Text color to match brown theme */
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #decba4;
}
</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <h1>Cart</h1>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cartItem" items="${cartItems}"> <!-- Ensure this matches the attribute name used in the model -->
                <tr>
                    <td>${cartItem.bookId}</td>
                    <td>${cartItem.bookName}</td>
                    <td>${cartItem.quantity}</td>
                    <td>${cartItem.price}</td>
                    <td>
                     <div style="display: flex; align-items: center; gap: 10px;">
                        <form action="${pageContext.request.contextPath}/addtocart" method="post">
                            <input type="hidden" name="bookId" value="${cartItem.bookId}">
                            <input type="number" name="quantity" min="1" value="${cartItem.quantity}" class="form-control" style="width: 60px; display: inline-block; margin-right: 10px;">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>    
						<form action="${pageContext.request.contextPath}/deleteitem" method="post">
						    <input type="hidden" name="bookId" value="${cartItem.bookId}">
						    <input type="hidden" name="quantity" value="${cartItem.quantity}">
						    <button type="button" onclick="removeItem(${cartItem.bookId})" class="btn btn-danger">
						        <i class="fas fa-trash"></i> Remove
						    </button>
						</form>
						</div>
                    </td>
                </tr>
            </c:forEach>
                <tr>
        <td colspan="3" style="text-align: right;"><strong>Total:</strong></td>
        <td>
            <c:set var="total" value="0" />
            <c:forEach var="cartItem" items="${cartItems}" varStatus="status">
                <c:set var="total" value="${total + (cartItem.price * cartItem.quantity)}" />
            </c:forEach>
            $<c:out value="${total}" />
        </td>
        <td></td>
    </tr>
            
        </tbody>        
    </table>
    <div style="text-align: right; margin-top: 20px;">
    <form action="${pageContext.request.contextPath}/checkout" method="post">
        <input type="hidden" name="total" value="${total}">
        <button type="submit" class="btn btn-success">Proceed to Checkout</button>
    </form>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function removeItem(bookId) {
    if (confirm('Are you sure you want to remove this item?')) {
        var form = document.createElement('form');
        form.method = 'post';
        form.action = '${pageContext.request.contextPath}/deleteitem';
        
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'bookId';
        input.value = bookId;
        
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}

</script>
</body>
</html>
