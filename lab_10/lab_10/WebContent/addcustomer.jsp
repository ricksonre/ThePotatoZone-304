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
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String phonenum = request.getParameter("phonenum");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String postalCode = request.getParameter("postalCode");
String country = request.getParameter("country");
String userid = request.getParameter("userid");
String password = request.getParameter("password");
		try 
		{
			
			String uid = "rreichma";
			String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
			String pw = "69750420";
			Connection con = DriverManager.getConnection(url, uid, pw);
			String query = "INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES (\'" +firstName +"\', \'" +lastName +"\', \'" +email +"\', \'" +phonenum +"\', \'" +address +"\', \'" +city +"\', \'" +state +"\', \'" +postalCode +"\', \'" +country +"\', \'" +userid +"\', \'" +password +"\');";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.execute();
			out.println("<h2>User Added:</h2>");
			out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Customer Name</th><th width=70% >" +firstName +" " +lastName +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Email</th><th width=70% >" +email +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Phone Number</th><th width=70% >" +phonenum +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Address</th><th width=70% >" +address +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >City</th><th width=70% >" +city +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >State</th><th width=70% >" +state +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Postal Code</th><th width=70% >" +postalCode +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Country</th><th width=70% >" +country +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Username</th><th width=70% >" +userid +"</th></tr>");
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Password</th><th width=70% >" +password +"</th></tr>");
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
