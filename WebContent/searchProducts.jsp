<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Search</title>
<link rel="stylesheet"
		href=""> <!--add css reference-->
</head>
<body>
	<button onclick="window.location.href='account.jsp';">Return to home</button>

	<h3>keyword search</h3>
	<form action = 'searchProductsHandler.jsp' method ='post'>
		<input type="text" name="search" placeholder="search">
		<button type="submit">Search</button>
	</form>
</body>
</html>