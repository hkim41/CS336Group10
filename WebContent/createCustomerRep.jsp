<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create customer representatives</title>
</head>
<body>
	<button onclick="window.location.href='adminlanding.jsp';">Return to Admin landing</button>
<h3> Create a New Customer Representative Account</h3>
	<form action="checkCreateCustomerRep.jsp" method="POST">
		Enter name: <input type="text" name="name" /> <br /> Enter username:
		<input type="text" name="username" /> <br /> Enter password: <input
			type="password" name="password" /> <br /> Enter address: <input
			type="text" name="address" /> <br /> Enter email: <input
			type="text" name="email" /> <br /> <input type="submit"
			value="Submit" />
	</form>
</body>
</html>
