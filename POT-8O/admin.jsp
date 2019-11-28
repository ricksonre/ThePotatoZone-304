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
// page header
out.println("<h2>Administrator Sales Report by Day</h2>");

//connects to the db
getConnection();

//preapares statements to get saales report
String query = "SELECT orderDate,totalAmount FROM ordersummary ORDER BY orderDate;";	
System.out.print("pass");	
PreparedStatement stat = con.prepareStatement(query);

//run prepared statement
ResultSet set = stat.executeQuery();

//creates containers to keep information about the sales
String[] dateboy = new String[100000];
Double[] datesum = new Double[100000];
int currentdate = 0;

//loops through result set from prepared statement
while(set.next())
{
	//format to display date as
	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd"); 
	//get date attr from the result set
	Date result = new Date(set.getDate(1).getTime()); 

	//handles assigns the values from the result set into the arrays and sum sales the sales if necessary
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
	//curerency format
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
	//prints table header
	out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
	out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th>Date</th><th>Total Amount</th></tr>");
	//loops through the arrays and prints its values into the table
	for (int i =0; i <dateboy.length;i++){
		if(dateboy[i]!=null){
			
			out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><td style='text-align: center; border: 2px solid rgb(184, 184, 184)'>"+dateboy[i]+"</td>");
			out.println("<td style='text-align: right; border: 2px solid rgb(184, 184, 184)'>"+currFormat.format(datesum[i])+"</td></tr>");
		}else{
			break;
		}
	}
	out.print("</table>");

	con.close();
%>

</body>
</html>

