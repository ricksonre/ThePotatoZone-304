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
			if(customerId != "")
			  {
			   //Check if any fields are empty
			   String conf = "SELECT firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password FROM customer WHERE customerId = \'"+customerId +"'";
			   PreparedStatement confps = con.prepareStatement(conf);
			   ResultSet confSet = confps.executeQuery();
			   confSet.next();
			   //Keeps previous values of empty fields
			   if(firstName == "")
				   firstName = confSet.getString(1);
			   if(lastName == "")
				   lastName = confSet.getString(2);
			   if(email == "")
				   email = confSet.getString(3);
			   if(phonenum == "")
				   phonenum = confSet.getString(4);
			   if(address == "")
				   address = confSet.getString(5);
			   if(city == "")
				   city = confSet.getString(6);
			   if(state == "")
				   state = confSet.getString(7);
			   if(postalCode == "")
				   postalCode = confSet.getString(8);
			   if(country == "")
				   country = confSet.getString(9);
			   if(userid == "")
				   userid = confSet.getString(10);
			   if(password == "")
				   password = confSet.getString(11);
			
			   String query = "UPDATE customer SET firstName = \'" +firstName +"\', lastName = \'" +lastName +"\', email = \'" +email +"\', phonenum = \'" +phonenum +"\', address = \'" +address +"\', city = \'" +city +"\', state = \'" +state +"\', postalCode = \'" +postalCode +"\', country = \'" +country +"\', userid = \'" +userid +"\', password = \'" +password +"\' WHERE customerId = \'" +customerId +"\';";
			   PreparedStatement pstmt = con.prepareStatement(query);
			   pstmt.execute();
			   System.out.println(query);
			   out.println("<h2>User Updated:</h2>");
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
