<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>POT-8O Orbital Bombardment Groceries</title>
</head>
<body>

<% 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////dublido////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Get product name to search for
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	String pnum = request.getParameter("pnum");
	String adress = request.getParameter("adress");
	String city = request.getParameter("city");
	String zip = request.getParameter("zip");
	String state = request.getParameter("state");
	String country = request.getParameter("country");
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
    getConnection();

    String query = "insert into customer (firstName,lastName,email,phonenum,address,city,state,postalCode,country,userid,password) values ('"+ fname+"','"+lname +"','"+ email +"','"+  pnum+"','"+ adress+"','"
        + city+"','"+ state+"','"+ zip+"','"+ country+"','"+ userid+"','"+ password+"');";
    PreparedStatement stat = con.prepareStatement(query);
	stat.execute();



	con.close();

    response.sendRedirect("login.jsp");
%>

</body>
</html>