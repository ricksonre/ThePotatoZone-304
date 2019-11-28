<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Customer Page</title>
</head>
<body>
<br><br>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	//connects to db
	getConnection();
	//gets userName from session
	String userName = session.getAttribute("authenticatedUser").toString();

	//if the user is not connected redirect them to the login page
	if(userName == null)
	{
		out.println("please login to see this page!");
		response.sendRedirect("login.jsp");
	}

	//prepare query about the customer information
	String query = "SELECT * FROM customer WHERE userid=?;";
	System.out.print("pass");
	PreparedStatement stat = con.prepareStatement(query);
	stat.setString(1, userName);

	//executes query
	ResultSet set = stat.executeQuery();

	//gets first index of result set
	//	it should only have 1 row as customer id is unique
	int u = 1;
	set.next();
	ResultSetMetaData meta = set.getMetaData();

	//prints table with the customer information
	out.println("<table id='customerInfo' style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
	for(int i =1;i<11;i++){
		out.println("<tr style='margin: 9px 9px 9px 9px'><th width = '20%' style='font-size:22px; padding-top: 9px; padding-bottom: 9px;'>"+meta.getColumnName(i) +"</th><td style='font-size:20px; padding-top: 9px; padding-bottom: 9px;'>"+set.getString(i)+"</td></tr>");

	}
	out.println("</table>");


	con.close();
%>

</body>
</html>
