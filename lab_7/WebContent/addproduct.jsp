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
String productName = request.getParameter("productName");
String productPrice = request.getParameter("productPrice");
String productImageURL = request.getParameter("productImageURL");
String productDesc = request.getParameter("productDesc");
String categoryId = request.getParameter("categoryId");
		try 
		{
			
			String uid = "rreichma";
			String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
			String pw = "69750420";
			Connection con = DriverManager.getConnection(url, uid, pw);
			String query = "INSERT INTO product (productName, productPrice, productImageURL, productDesc, categoryId) VALUES (\'" +productName +"\', \'" +productPrice +"\', \'" +productImageURL +"\', \'" +productDesc +"\', \'" +categoryId +"\');";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.execute();
			out.println("<h2>Product Added:</h2>");
			out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Name</th><th width=70% >" +productName +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Price</th><th width=70% >" +productPrice +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Image URL</th><th width=70% >" +productImageURL +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Description</th><th width=70% >" +productDesc +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Category</th><th width=70% >" +categoryId +"</th></tr>");
		} 
		catch (SQLException ex) {
			out.println(ex);
		}
		finally
		{
			closeConnection();
		}	
		
	
%>
</body>
</html>
