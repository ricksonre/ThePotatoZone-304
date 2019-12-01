<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>warehouse?</title>
</head>
<body>
<h2> Warehouse WIP</h2>
<%
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
String uid = "rreichma";
String pw = "69750420";
		
System.out.println("Connecting to database.");
Connection con = DriverManager.getConnection(url, uid, pw);

//String query = "select warehouseId, warehouseName,  from productinventory";
String query = "select w.warehouseName, p.productName, p.productImageURL, pi.quantity from productinventory as pi join product as p on p.productId = pi.productId join warehouse as w on w.warehouseId = pi.warehouseId order by w.warehouseId";

PreparedStatement stat = con.prepareStatement(query);
ResultSet set = stat.executeQuery();

ResultSetMetaData rsmd = set.getMetaData();
/*
int columns = rsmd.getColumnCount();


for(int i = 1; i <= columns; i++) {
	if (i>1) 
		System.out.print(", ");
	System.out.print(rsmd.getColumnName(i));
}
System.out.println();

while(set.next()) {
	
	for (int i = 1; i <= columns; i++) {
		if (i>1) 
			System.out.print(", ");
		System.out.print(set.getString(i));
	}
	System.out.println();
}
*/

String display = "<table>";
display += "<tr><th>Warehouse</th><th>Image</th><th>Product Name</th><th>Quantity</th></tr>";

while(set.next()) {
	display += 
			"<tr>" +
			"<td align='middle' style='font-weight:bold;font-size:150%;'>" + set.getString("warehouseName") + "</td>" +
			"<td><img width=150 height=150 src=" + set.getString("productImageURL") + "></td>" +
			"<td align='middle'>" + set.getString("productName") + "</td>" +
			"<td align='middle'>" + set.getString("quantity") + "</td>" +
			"</tr>";
}


display += "</table>";

out.print(display);
// set.next();
// System.out.println(set.getString(2));





%>




</body>
</html>