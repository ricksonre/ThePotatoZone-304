<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.io.File" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>POT-8O Orbital Bombardment Groceries Order List</title>
</head>
<body>

<h1>Order List</h1>

<%
//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);  // Prints $5.00

// Make connection
		String uid = "rreichma";
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
		String pw = "69750420";
		Connection con = DriverManager.getConnection(url, uid, pw);
// Write query to retrieve all order summary records
		StringBuilder output = new StringBuilder();
    	String query = "Select orderId, product.productId, productName, quantity, price FROM  orderProduct LEFT OUTER JOIN product ON orderProduct.productId = product.productId";
        Statement stat = con.createStatement();

        ResultSet set = stat.executeQuery(query);
        ResultSetMetaData meta = set.getMetaData();

        output.append(meta.getColumnName(1) + ", " + meta.getColumnName(2) + ", " + meta.getColumnName(3) + ", " + meta.getColumnName(4) + ", " + meta.getColumnName(5));
        while(set.next())
        {
        output.append("<br>" + set.getString(1) + ", " + set.getString(2) +
            ", " + set.getString(3) + ", " + set.getString(4)+
            ", " + set.getString(5));
        }
        System.out.println(output.toString());
		out.println(output.toString());
		
		
// For each order in the ResultSet

	// Print out the order summary information
	// Write a query to retrieve the products in the order
	//   - Use a PreparedStatement as will repeat this query many times
	// For each product in the order
		// Write out product information 

// Close connection
%>

</body>
</html>

