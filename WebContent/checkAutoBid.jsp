<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check AutoBid</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
<% 
session.setAttribute("autobid_bool", request.getParameter("autobid_bool"));
if(request.getParameter("autobid_bool").equals("yes"))
{
	
	response.sendRedirect(""); <!--insert autobid true jsp page-->
}
else
{
	response.sendRedirect(""); <!-- insert Autobid False jsp page-->
}
	%>
</body>
</html>