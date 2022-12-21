<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Products</title>
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css"><!--https://www.jsdelivr.com/package/npm/water.css-->
</head>
<body>
	<button onclick="window.location.href='searchProducts.jsp';">Return to search</button>
<h3> These are the list of items based on your keyword</h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String entity = request.getParameter("search");
		System.out.println(entity);
		
		String str = "SELECT * FROM product WHERE category LIKE '%" + entity+ "%' or brand LIKE '%" +entity + "%' or cardcolor LIKE '%" +entity + "%' or boxsize LIKE '%" +entity +  "%'" ;
		ResultSet rs = stmt.executeQuery(str);
		
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("Product ID");
		out.print("</td>");
		out.print("<td>");
		out.print("Category");
		out.print("</td>");
		out.print("<td>");
		out.print("Brand");
		out.print("</td>");
		out.print("<td>");
		out.print("Card Color");
		out.print("</td>");
		out.print("<td>");
		out.print("Box Size");
		out.print("</td>");
		out.print("<td>");
		out.print("Seller");
		out.print("</td>");
		out.print("</tr>");

		while (rs.next()) {

			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getInt("product_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("category"));
			out.print("</td>");

			out.print("<td>");
			out.print(rs.getString("brand"));
			out.print("</td>");

			out.print("<td>");
			out.print(rs.getString("cardcolor"));
			out.print("</td>");

			out.print("<td>");
			out.print(rs.getString("boxsize"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("seller"));
			out.print("</td>");
			
			if(rs.getString("seller").equalsIgnoreCase(session.getAttribute("user").toString()))
			{
			
			out.print("<td>");
			out.print("<form action='createAuction.jsp' method='post'><button name='product_id' type='submit' value='"
			+ rs.getInt("product_id") + "'>submit auction</button></form>");
			out.print("</td>");
			}
			
			else{
			out.print("<td>");
			out.print("<form action='createAlertProduct.jsp' method='post'><button name='product_id' type='submit' value='"
			+ rs.getInt("product_id") + "'> send me an alert </button></form>");
			out.print("</td>");
			}
			
			
			out.print("</tr>");
		}

		out.print("</table>");
		con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>
