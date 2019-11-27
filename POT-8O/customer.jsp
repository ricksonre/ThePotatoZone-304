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
	getConnection();
	String userName = session.getAttribute("authenticatedUser").toString();

	if(userName == null)
	{
		out.println("please login to see this page!");
		response.sendRedirect("login.jsp");
	}

/*
	String uid = "rreichma";
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
	String pw = "69750420";
	Connection con = DriverManager.getConnection(url, uid, pw);*/
	String query = "SELECT * FROM customer WHERE userid=?;";
	System.out.print("pass");
	PreparedStatement stat = con.prepareStatement(query);
	stat.setString(1, userName);

	ResultSet set = stat.executeQuery();

	int u = 1;
	set.next();
	ResultSetMetaData meta = set.getMetaData();


	out.println("<table id='customerInfo' style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
	for(int i =1;i<11;i++){
		out.println("<tr style='margin: 9px 9px 9px 9px'><th width = '20%' style='font-size:22px; padding-top: 9px; padding-bottom: 9px;'>"+meta.getColumnName(i) +"</th><td style='font-size:20px; padding-top: 9px; padding-bottom: 9px;'>"+set.getString(i)+"</td></tr>");

	}
	out.println("</table>");


// Make sure to close connection
%>

</body>
</html>
