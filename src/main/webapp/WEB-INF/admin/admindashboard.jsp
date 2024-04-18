<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
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
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="btn-container">
            <form action="newbook" method="get">
            <button class="btn custom-submit" type="submit">Add New Book</button>
            </form>
        </div>
    </div>
<jsp:include page="../footer.jsp"></jsp:include>    
</body>
</html>
