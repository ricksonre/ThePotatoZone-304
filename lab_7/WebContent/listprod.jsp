<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery</title>
</head>
<body>

<h1>Search for the products you want to buy:</h1>

<form method="get" action="listprod.jsp">
<input type="text" name="productName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>

<% // Get product name to search for
	String name = request.getParameter("productName");

	if(name.equals(""))
	{
		name = "all";
	}


	//Note: Forces loading of SQL Server driver
	try
	{	// Load driver class
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch (java.lang.ClassNotFoundException e)
	{
		out.println("ClassNotFoundException: " +e);
	}

	// Variable name now contains the search string the user entered
	// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
	String uid = "rreichma";
	String pw = "69750420";
			
	System.out.println("Connecting to database.");

	Connection con = DriverManager.getConnection(url, uid, pw);
	String query = "select * from product";
	PreparedStatement stat = con.prepareStatement(query);
	ResultSet set = stat.executeQuery();
	
	String tablet = "<table style='width:80%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)''>";
	while(set.next())
	{
		tablet += "<tr style='border: 2px solid rgb(184, 184, 184)';>";
		tablet += "<td><img src=>" + set.getString(4) + "<br><td>";
		tablet += "<td>" + set.getString(2) + "<td>";
		tablet += "</tr>";
	}
	out.println(tablet);
	// For each product create a link of the form
	// addcart.jsp?id=productId&name=productName&price=productPrice
	// Close connection

	// Useful code for formatting currency values:
	// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
	// out.println(currFormat.format(5.0);	// Prints $5.00
%>

</body>
</html>