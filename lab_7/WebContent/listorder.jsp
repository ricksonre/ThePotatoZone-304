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
		String bquery = "SELECT orderId, orderDate, orderSummary.customerId, customer.firstName, customer.lastName, totalAmount FROM ordersummary LEFT OUTER JOIN customer ON ordersummary.customerId = customer.customerId";
        Statement bstat = con.createStatement();
        ResultSet bset = bstat.executeQuery(bquery);
        ResultSetMetaData bmeta = bset.getMetaData();
        String query = "Select orderId, product.productId, productName, quantity, price FROM  orderProduct LEFT OUTER JOIN product ON orderProduct.productId = product.productId";
        Statement stat = con.createStatement();

        
		
		
// For each order in the ResultSet

	// Print out the order summary information
	// Write a query to retrieve the products in the order
	//   - Use a PreparedStatement as will repeat this query many times
	// For each product in the order
		// Write out product information 
		/*
		output.append(bmeta.getColumnName(1) + ", " + bmeta.getColumnName(2) + ", " + bmeta.getColumnName(3) + ", " + "Customer Name" + ", " + bmeta.getColumnName(6));
        while(bset.next())
        	 {
        	  ResultSet set = stat.executeQuery(query);
        	  ResultSetMetaData meta = set.getMetaData();
        	  output.append("<br>" + bset.getString(1) + ", " + bset.getString(2) + ", " + bset.getString(3) + ", " + bset.getString(4)+ " " + bset.getString(5) +", $"+ bset.getString(6));
        	  output.append("<br>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + meta.getColumnName(1) + ", " + meta.getColumnName(2) + ", " + meta.getColumnName(3) + ", " + meta.getColumnName(4) + ", " + meta.getColumnName(5));
        	  while(set.next())
        	  	   {
        		    if(bset.getString(1).equals(set.getString(1)))
        		      {
        		       output.append("<br>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ set.getString(1) + ", " + set.getString(2) + ", " + set.getString(3) + ", " + set.getString(4)+ ", $" +set.getString(5));
        		      }
        	  	   }
        	  output.append("<br>");
        	 }
        System.out.println(output.toString());
		out.println(output.toString());*/
		//=======================================================================================================
		String tablet = "<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)''>";
		tablet += "<tr><th>" +bmeta.getColumnName(1) +"</th><th>" +bmeta.getColumnName(2) +"</th><th>" +bmeta.getColumnName(3) +"</th><th>Customer Name</th><th>" +bmeta.getColumnName(6) +"</th><th>" +"</tr>";
		while(bset.next())
			{
				ResultSet set = stat.executeQuery(query);
      			ResultSetMetaData meta = set.getMetaData();
      			tablet += "<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)''>";
				tablet += "<tr><td>" +bset.getString(1) +"</td><td>" +bset.getString(2) +"</td><td>" +bset.getString(3) +"</td><td>"+bset.getString(4)+" "+bset.getString(5) +"</td><td>$" +bset.getString(6) +"</td><td>" +"</tr>";
				tablet += "<table style='width:100%; border-collapse:collapse; border: 2px solid rgb(184, 184, 184)''>";
				tablet += "<tr><th> </th><th> </th><th>" +meta.getColumnName(3) +"</th><th>" +meta.getColumnName(4) +"</th><th>" +meta.getColumnName(5) +"</th><th>" +"</tr>";
				while(set.next())
					{
						if(bset.getString(1).equals(set.getString(1)))
      		    		  {
							tablet += "<tr><td> </td><td> </td><td>" +set.getString(3) +"</td><td>"+set.getString(4)+"</td><td>$"+set.getString(5) +"</td><td></tr>";
      		    		  }
					}
			}
			out.println(tablet);
				//=======================================================================================================
// Close connection
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

</body>
</html>

