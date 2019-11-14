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

<% 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////dublido////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// Get product name to search for
	String name = request.getParameter("productName");

	//Note: Forces loading of SQL Server driver
	try
	{	// Load driver class
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch (java.lang.ClassNotFoundException e)
	{
		out.println("ClassNotFoundException: " +e);
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////connect////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	// Variable name now contains the search string the user entered
	// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
	String uid = "rreichma";
	String pw = "69750420";
			
	System.out.println("Connecting to database.");
	Connection con = DriverManager.getConnection(url, uid, pw);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////string manage////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	String query = "select * from product";

	if(!name.equals(""))
	{
		String[] split = name.split(" ");
		query += " where productName in (?)" + split.toString();

		String items = split.stream()
		.map(x -> String.valueOf(x))
		.collect(Collectors.joining(",", "(", ")"));
			
    	query = sql.replace("(?)", items);
	}
	query += " order by productName asc;";

	
	String query = "select * from product";
	PreparedStatement stat = con.prepareStatement(query);
	ResultSet set = stat.executeQuery();
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////set to html////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	String tablet = "<table style='width:80%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)''>";
	while(set.next())
	{
		tablet += "<tr style='border: 2px solid rgb(184, 184, 184)';>";
		tablet += "<td width=150 height=150 style='padding: 5px 5px 5px 9px;'><img width=150 height=150 style='background: solid rgb(184, 184, 184);' src=" 
			+ set.getString(4) + "></td>";
		tablet += "<td style='padding: 9px 9px 9px 9px;'><p style='font-size:20px;margin-bottom: 15px;'>" + set.getString(2) + "</p>";
		tablet += "<p>" + set.getString(6) + "<br></p>";
		tablet += "<p>" + set.getString(3) + "<br></p></td>";
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