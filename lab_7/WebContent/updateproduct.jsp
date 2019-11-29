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
			if(productId != "")
			  {
			   //Check if any fields are empty
			   String conf = "SELECT productName, productPrice, productImageURL, productDesc, categoryId FROM product WHERE productId = \'"+productId +"'";
			   PreparedStatement confps = con.prepareStatement(conf);
			   ResultSet confSet = confps.executeQuery();
			   confSet.next();
			   //Keeps previous values of empty fields
			   if(productName == "")
				   productName = confSet.getString(1);
			   if(productPrice == "")
				   productPrice = confSet.getString(2);
			   if(productImageURL == "")
				   productImageURL = confSet.getString(3);
			   if(productDesc == "")
				   productDesc = confSet.getString(4);
			   if(categoryId == "")
				   categoryId = confSet.getString(5);
			
			   String query = "UPDATE product SET productName = \'" +productName +"\', productPrice = \'" +productPrice +"\', productImageURL = \'" +productImageURL +"\', productDesc = \'" +productDesc +"\', categoryId = \'" +categoryId +"\' WHERE productId = \'" +productId +"\';";
			   PreparedStatement pstmt = con.prepareStatement(query);
			   pstmt.execute();
			   System.out.println(query);
			   out.println("<h2>Product Updated:</h2>");
			   out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Name</th><th width=70% >" +productName +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Price</th><th width=70% >" +productPrice +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >ProductImageURL</th><th width=70% >" +productImageURL +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Description</th><th width=70% >" +productDesc +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Product Category</th><th width=70% >" +categoryId +"</th></tr>");
			  }
			else
				out.println("<h2>ProductId field cannot be empty.</h2>");
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
