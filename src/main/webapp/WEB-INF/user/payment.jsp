<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<style>
.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], select {
	width: 100%;
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[disabled] {
	background-color: #ccc;
	cursor: not-allowed;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Checkout</h2>
		<form id="checkoutForm" action="${pageContext.request.contextPath}/checkout" method="post">
			<label for="paymentMethod">Payment Method:</label> <select
				id="paymentMethod" name="paymentMethod"
				onchange="handlePaymentMethodChange()">
				<option value="pickup">Payment on Pickup</option>
				<option value="creditcard">Credit Card</option>
			</select> <br>
			<div id="creditCardFields" style="display: none;">
				<label for="creditCardNumber">Credit Card Number:</label> <input
					type="text" id="creditCardNumber" name="creditCardNumber">
				<br> <label for="expiryDate">Expiry Date:</label> <input
					type="text" id="expiryDate" name="expiryDate"> <br> <label
					for="cvv">CVV:</label> <input type="text" id="cvv" name="cvv">
				<br>
			</div>

			<button id="confirmButton" type="submit" disabled>Confirm
				Order</button>
		</form>
	</div>
	<script>

	function handlePaymentMethodChange() {
	    var paymentMethod = document.getElementById("paymentMethod").value;
	    var creditCardFields = document.getElementById("creditCardFields");
	    var confirmButton = document.getElementById("confirmButton");

	    if (paymentMethod === "creditcard") {
	        creditCardFields.style.display = "block";
	        validateCreditCardInputs();
	    } else {
	        creditCardFields.style.display = "none";
	        confirmButton.disabled = false;
	    }
	}

	function validateCreditCardInputs() {
	    var confirmButton = document.getElementById("confirmButton");
	    var cardNumber = document.getElementById("creditCardNumber").value;
	    var expiryDate = document.getElementById("expiryDate").value;
	    var cvv = document.getElementById("cvv").value;

	    confirmButton.disabled = cardNumber === '' || expiryDate === '' || cvv === '';
	}

	document.addEventListener('DOMContentLoaded', function() {
	    handlePaymentMethodChange(); 
	    setupInputListeners();
	});

	function setupInputListeners() {
	    document.getElementById("creditCardNumber").addEventListener('input', validateCreditCardInputs);
	    document.getElementById("expiryDate").addEventListener('input', validateCreditCardInputs);
	    document.getElementById("cvv").addEventListener('input', validateCreditCardInputs);
	}

	</script>
</body>
</html>

