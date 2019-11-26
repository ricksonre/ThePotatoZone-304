<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>POT-8O Orbital Bombardment Groceries</title>
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

	String query = "select * from product left join category on product.categoryId = category.categoryId";

	if(!name.equals(""))
	{
		query += " where productName like '%" + name + "%' or category.categoryName like '%" + name + "%' ";
	}
	query += " order by productName asc;";

	PreparedStatement stat = con.prepareStatement(query);
	ResultSet set = stat.executeQuery();
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////set to html////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
	
	String tablet = "<br><table style='width:80%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)''>";
	while(set.next())
	{
		tablet += "<tr style='border: 2px solid rgb(184, 184, 184)';>"
			+ "<td width=150 height=150 style='padding: 5px 5px 5px 9px;'><img width=150 height=150 style='background: solid rgb(184, 184, 184);' src=" 
			+ set.getString(4) + "></td>"
			+ "<td style='padding: 9px 9px 9px 9px;'><p style='font-size:20px;margin-bottom: 15px;'><a href=\"product.jsp?id="+set.getString(1)+"\">"+ set.getString(2) + "</a></p>"
		 	+ "<p>" + set.getString(6) + "<br></p>"
		 	+ "<p style='font-weight:bold;'>" + set.getString(9) + "<br></p>"
			+ "<p>" + currFormat.format(set.getDouble(3)) + "<br></p>"
			+ "<a style='border-radius: 6px; color:black; text-decoration:none; padding: 3px 3px 3px 3px; border: 2px solid rgb(184, 184, 184); background-color: #ffe894' href=\"addcart.jsp?id=" + set.getString(1) + "&name=" + set.getString(2) + "&price=" + set.getString(3) + "\">Add To Cart</a>"
			+ "</td>"
			+ "</tr>";
	}
	out.println(tablet);

	con.close();
%>

</body>
</html>