<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Admin Login Details</title>
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css"><!--https://www.jsdelivr.com/package/npm/water.css-->
</head>
<body>
<%
	String userid = request.getParameter("uname");   
	String pwd = request.getParameter("upass");
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	Statement stmt = con.createStatement();	
	
	ResultSet rs;
    rs = stmt.executeQuery("SELECT * FROM users WHERE username='" + userid + "'");
    if (rs.next()){
    	 ResultSet rs1;
    	    rs1 = stmt.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
    	    if (rs1.next()) {
    	    	ResultSet rs2;
    	    	rs2 = stmt.executeQuery("select * FROM users WHERE username='" + userid + 
    	    			"' and password='"+ pwd + "' and account_type= 'admin'");
    	    	if (rs2.next()) {
    	    		session.setAttribute("user", userid);
        	        response.sendRedirect("adminlanding.jsp");
        	        out.println("welcome " + userid);
        	        out.println("<a href='logout.jsp'>Log out</a>");
        	        out.println("<a href='account.jsp'>Account Page</a>");
    	    	} else {
    	    		out.println("Invalid account type <a href='adminlogin.jsp'>Please try again</a>");
    	    	}
    	    } else {
    	        out.println("Invalid password <a href='adminlogin.jsp'>Please try again</a>");
    	    }
    }
    else{
    	out.println("Username doesn't exist <a href='adminlogin.jsp'>Please try again</a>");
    }
%>
</body>
</html>
