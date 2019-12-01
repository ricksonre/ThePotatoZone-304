<!DOCTYPE html>
<html>
<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Administrator Page</title>
</head>
<body>
<%
session = request.getSession(true);
String productId = request.getParameter("productId");
		try 
		{
			
			String uid = "rreichma";
			String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
			String pw = "69750420";
			Connection con = DriverManager.getConnection(url, uid, pw);
			if(productId != "")
			  {
			   String conf = "SELECT productName, productPrice, productImageURL, productDesc, categoryId FROM product WHERE productId = \'"+productId +"'";
			   PreparedStatement confps = con.prepareStatement(conf);
			   ResultSet confSet = confps.executeQuery();
			   confSet.next();
			   String query = "DELETE FROM product WHERE productId = \'" +productId +"\'";
			   PreparedStatement pstmt = con.prepareStatement(query);
			   pstmt.execute();
			   out.println("<h2>Product Deleted:</h2>");
			   out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Name</th><th width=70% >" +confSet.getString(1) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Price</th><th width=70% >" +confSet.getString(2) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Image URL</th><th width=70% >" +confSet.getString(3) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Description</th><th width=70% >" +confSet.getString(4) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Category</th><th width=70% >" +confSet.getString(5) +"</th></tr>");
			  }
		} 
		catch (SQLException ex) {
			out.println("");
			out.println("");
			out.println("");
			out.println("");
			out.println("");
			out.println(ex);
		}
		finally
		{
			closeConnection();
		}	
		
	
%>
</body>
</html>
