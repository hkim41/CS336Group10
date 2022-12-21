<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Bids</title>
<link rel="stylesheet"
		href=""> <!--add a css reference here-->
</head>
<body>
	<button onclick="window.location.href='manageAuctionsCustomerRep.jsp';">Return to View All Auctions</button>

<h3> view all bids</h3>
<% 
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement statement = con.createStatement();
ResultSet result = null;
PreparedStatement statement = null;
int auction_id = Integer.parseInt(request.getParameter("auction_id"));
session.setAttribute("auction_id", auction_id);
String bid = "select status from auction where auction_id = ?";
PreparedStatement statement1 = con.prepareStatement(bid);
statement1.setInt(1, auction_id);
ResultSet rs = statement1.executeQuery();
try 
{
	String viewBid = "SELECT * FROM bid join auction using (auction_id) WHERE auction_id = ? order by amount desc";
	statement = con.prepareStatement(viewBid);
	statement.setInt(1, auction_id);
	result = statement.executeQuery();
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Bid ID ");
	out.print("</th>");		
	out.print("<th>");
	out.print("Buyer");
	out.print("</th>");	
	out.print("<th>");
	out.print("Amount");
	out.print("</th>");	
	out.print("<th>");
	out.print("Auto Bid: On or Off?");
	out.print("</th>");
	
	out.print("<th>");
	out.print("Bid Increment");
	out.print("</th>");
	
	out.print("<th>");
	out.print("Upper Limit");
	out.print("</th>");
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getInt("bid_id"));
		out.print("</td>");
		
		if(result.getString("buyer")==null)
{
		out.print("<td>");
		out.print("Deleted User");
		out.print("</td>");
}
		else
		{
		out.print("<td>");
		out.print(result.getString("buyer"));
		out.print("</td>");
		}
		
		out.print("<td>");
		out.print("$" + result.getString("amount"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getBoolean("is_autobid"));
		out.print("</td>");
		
		if(result.getFloat("bid_increment") == -1)
		{
			out.print("<td>");
			out.print("action failed. Autobid is off");
			out.print("</td>");
		}
		else
		{
			out.print("<td>");
			out.print(result.getFloat("bid_increment"));
			out.print("</td>");
		}
		
		if(result.getFloat("upper_limit") == -1)
		{
			out.print("<td>");
			out.print("action failed. Autobid is off");
			out.print("</td>");
		}
		else
		{
			out.print("<td>");
			out.print(result.getFloat("upper_limit"));
			out.print("</td>");
		}
		
		
		String status = result.getString("status");
		if(status.equals("open"))
		{
		out.print("<td>");
		out.print("<form action='removebids.jsp' method='post'><button name='bid_id' type='submit' value='" + result.getInt("bid_id") + "'>Remove Bid</button></form>");
		out.print("</td>");
		}
		out.print("</tr>");
	}
	out.print("</table>");	
	
}
catch (Exception e) 
{
		out.print(e);
}
finally
{
	if (result != null) result.close();
	if (statement != null) statement.close();
	if (statement != null) statement.close();
	if (con != null) con.close();
}%>

</body>
</html>