<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%

// TODO: Print Customer information
	
	String uid = "rreichma";
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
	String pw = "69750420";
	Connection con = DriverManager.getConnection(url, uid, pw);
	String query = "SELECT * FROM customer WHERE userid=?;";	
	System.out.print("pass");	
	PreparedStatement stat = con.prepareStatement(query);
	stat.setString(1, session.getAttribute("authenticatedUser").toString());
	
	ResultSet set = stat.executeQuery();
	out.println("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
	int u = 1;
	set.next();
	ResultSetMetaData meta = set.getMetaData();
	
	for(int i =1;i<11;i++){
		out.println("<tr><th>"+meta.getColumnName(i) +"</th><td>"+set.getString(i)+"</td></tr>");
		
	}
	out.println("</table>");


// Make sure to close connection
%>

</body>
</html>

