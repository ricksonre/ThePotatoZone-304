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
String customerId = request.getParameter("customerId");
		try 
		{
			
			String uid = "rreichma";
			String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
			String pw = "69750420";
			Connection con = DriverManager.getConnection(url, uid, pw);
			if(customerId != "")
			  {
			   String conf = "SELECT firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password FROM customer WHERE customerId = \'"+customerId +"'";
			   PreparedStatement confps = con.prepareStatement(conf);
			   ResultSet confSet = confps.executeQuery();
			   confSet.next();
			   String query = "DELETE FROM customer WHERE customerId = \'" +customerId +"\'";
			   PreparedStatement pstmt = con.prepareStatement(query);
			   pstmt.execute();
			   out.println("<h2>SKIDADDLE SKIDOODLE THIS CUSTOMER IS NOW A NOODLE</h2>");
			   out.println("<img src=\"https://www.inspiredtaste.net/wp-content/uploads/2017/08/Sweet-Potato-Noodles-Recipe-4-1200.jpg\" alt=\"The customer has become potato noodles!\" height=\"10%\" style='position: relative; left: 10%; right: 10%'>");
			   out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Customer Name</th><th width=70% >" +confSet.getString(1) +" " +confSet.getString(2) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Email</th><th width=70% >" +confSet.getString(3) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Phone Number</th><th width=70% >" +confSet.getString(4) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Address</th><th width=70% >" +confSet.getString(5) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >City</th><th width=70% >" +confSet.getString(6) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >State</th><th width=70% >" +confSet.getString(7) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Postal Code</th><th width=70% >" +confSet.getString(8) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Country</th><th width=70% >" +confSet.getString(9) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Username</th><th width=70% >" +confSet.getString(10) +"</th></tr>");
			   out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=30% >Password</th><th width=70% >" +confSet.getString(11) +"</th></tr>");
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
