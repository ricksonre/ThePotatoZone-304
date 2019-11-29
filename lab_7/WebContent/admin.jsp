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
//////////////////////////////////List Customers/////////////////////////////////////////////
String custQuery = "SELECT customerId, firstName, lastName FROM customer";
PreparedStatement custStat = con.prepareStatement(custQuery);
ResultSet custSet = custStat.executeQuery();

out.println("<h2>Customer List</h2>");
out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=10% >ID</th><th width=90% >Full Name</th></tr>");
while(custSet.next())
	 {
	  out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><td style='text-align: center; border: 2px solid rgb(184, 184, 184)'>"+custSet.getString(1)+"</td>");
	  out.println("<td style='text-align: center; border: 2px solid rgb(184, 184, 184)'>"+custSet.getString(2)+" "+custSet.getString(3)+"</td></tr>");
	 }
out.print("</table>");
///////////////////////////////List Total Sales//////////////////////////////////////////
String saleQuery = "SELECT orderId, totalAmount FROM ordersummary";
PreparedStatement saleStat = con.prepareStatement(saleQuery);
ResultSet saleSet = saleStat.executeQuery();

out.println("<h2>Total Orders</h2>");
out.print("<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)'>");
out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th width=10% >Order ID</th><th width=90% >Total Amount</th></tr>");
while(saleSet.next())
	 {
	  out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><td style='text-align: center; border: 2px solid rgb(184, 184, 184)'>"+saleSet.getString(1)+"</td>");
	  out.println("<td style='text-align: center; border: 2px solid rgb(184, 184, 184)'>"+saleSet.getString(2)+"</td></tr>");
	 }
saleQuery = "SELECT SUM(totalAmount) FROM ordersummary";
saleStat = con.prepareStatement(saleQuery);
saleSet = saleStat.executeQuery();
saleSet.next();
out.print("<tr style='border: 2px solid rgb(184, 184, 184)'><th style='text-align: center; border: 2px solid rgb(184, 184, 184)'>Total Sales</th>");
out.println("<td style='text-align: center; border: 2px solid rgb(184, 184, 184)'>"+saleSet.getString(1)+"</td></tr>");
out.print("</table>");

//Close connection
		System.out.println("Closing database connection.");
		try
		{
			if (con != null)
	            con.close();
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
%>
<!-- =========================Add Product========================= -->>
<h2>Add New Product:</h2>
<br>
<form name="AddProd" method=post action="addproduct.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Name:</font></div></td>
	<td><input type="text" name="productName" size=40 maxlength="40"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Price:</font></div></td>
	<td><input type="number" name="productPrice" size=40 maxlength="10" step=".01" ></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image URL:</font></div></td>
	<td><input type="url" name="productImageURL" size=40 maxlength="1000"></td>
</tr>
<!--<tr>HOW DO I SQL IMAGES REEEEEEEEEEEEEEEEEEEEE
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image:</font></div></td>
	<td><input type="file" name="productImage"></td>
</tr>-->
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Description:</font></div></td>
	<td><input type="text" name="productDesc" size=40 maxlength="1000"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Category ID:</font></div></td>
	<td><input type="number" name="categoryId" size=40 maxlength="10"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Add Product">
</form>

<!-- ===================Update Product Info========================= -->
<h2>Update Product Info</h2>
<br>
<form name="UpdateProd" method=post action="updateproduct.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Id:</font></div></td>
	<td><input type="number" name="productId" size=40 maxlength="1000"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Name:</font></div></td>
	<td><input type="text" name="productName" size=40 maxlength="40"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Price:</font></div></td>
	<td><input type="number" name="productPrice" size=40 maxlength="10" step=".01" ></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image URL:</font></div></td>
	<td><input type="url" name="productImageURL" size=40 maxlength="1000"></td>
</tr>
<!--<tr>HOW DO I SQL IMAGES REEEEEEEEEEEEEEEEEEEEE
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image:</font></div></td>
	<td><input type="file" name="productImage"></td>
</tr>-->
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Description:</font></div></td>
	<td><input type="text" name="productDesc" size=40 maxlength="1000"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Category ID:</font></div></td>
	<td><input type="number" name="categoryId" size=40 maxlength="10"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Update Product">
</form>
<!-- ==================Delete Product================== -->
<h2>Delete Product</h2>
<br>
<form name="DeleteProd" method=post action="deleteproduct.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Id:</font></div></td>
	<td><input type="number" name="productId" size=40 maxlength="1000"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Delete Product">
</form>

<!-- ==================Restore Database================== -->
<h2>Restore Database</h2>
<br>
<form name="DeleteProd" method=post action="restore.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Input "RESTORE" to restore the database:</font></div></td>
	<td><input type="text" name="confirm" size=40 maxlength="40"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="RESTORE THE DATABASE!">
</form>

</body>
</html>

