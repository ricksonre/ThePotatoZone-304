<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Administrator Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
out.println("<h2>Administrator Sales Report by Day</h2>");

// TODO: Write SQL query that prints out total order amount by day

getConnection();

String query = "SELECT orderDate,totalAmount FROM ordersummary ORDER BY orderDate;";	
System.out.print("pass");	
PreparedStatement stat = con.prepareStatement(query);


ResultSet set = stat.executeQuery();
	String[] dateboy = new String[100000];
	Double[] datesum = new Double[100000];
	int currentdate = 0;
while(set.next()){
	SimpleDateFormat simple = new SimpleDateFormat("yyyy MM dd"); 
	Date result = new Date(set.getDate(1).getTime()); 
	if(dateboy[currentdate]==null){
		dateboy[currentdate]=simple.format(result);
		datesum[currentdate]=set.getDouble(2);
	}else if(dateboy[currentdate].equals(simple.format(result))){
		dateboy[currentdate]=simple.format(result);
		datesum[currentdate]+=set.getDouble(2);
	}else{
		currentdate++;
		dateboy[currentdate]=simple.format(result);
		datesum[currentdate]=set.getDouble(2);
	}
	
}
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
	out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
	out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th>Date</th><th>Total Amount</th></tr>");
	for (int i =0; i <dateboy.length;i++){
		if(dateboy[i]!=null){
			
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><td style='text-align: center; border: 2px solid rgb(184, 184, 184)'>"+dateboy[i]+"</td>");
			out.println("<td style='text-align: right; border: 2px solid rgb(184, 184, 184)'>"+currFormat.format(datesum[i])+"</td></tr>");
		}else{
			break;
		}
	}
	out.print("</table>");
%>

</body>
</html>

