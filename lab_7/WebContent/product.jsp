<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>Pot-8o orbital bombardment</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>

<%
// Get product name to search for
// TODO: Retrieve and display info for the product
String productId = request.getParameter("id");
String uid = "rreichma";
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
String pw = "69750420";
Connection con = DriverManager.getConnection(url, uid, pw);
String query =  "SELECT * FROM product WHERE productId=?";	
System.out.print("pass");

PreparedStatement stat = con.prepareStatement(query);
stat.setString(1, productId);

ResultSet set = stat.executeQuery();
set.next();

out.print("<h2>"+set.getString(2)+"</h2><table>"
    +"<tr> "
        +"<td>" 
            +(set.getString(4)==null?"":("<img width=150 height=150 src=\""+set.getString(4)+"\">")) 
        +"</td>"
        +"<td>" 
            +"<img width=150 height=150 src='displayImage.jsp?id=${productId}'>"
        +"</td>"
    +"</tr>"
    +"<tr>"
        +"<th>Id</th><td>" +set.getString(1)
    +"</td></tr>"
        +"<tr><th>Price</th><td>$"+set.getDouble(3)+"</td></tr>"
        + "<tr><td>$"+set.getDouble(2)+"</td></tr>"
    +"</table>");
out.print("<h3><a href=\"addcart.jsp?id="+set.getString(1)+"&name="+set.getString(2)+"&price="+set.getString(3)+"\">Add to Cart</a></h3>");
out.print("<h3><a href=\"listprod.jsp?productName=\">Continue Shopping</a>");

// TODO: If there is a productImageURL, display using IMG tag
		
// TODO: Retrieve any image stored directly in database. Note: Call displayImage.jsp with product id as parameter.
		
// TODO: Add links to Add to Cart and Continue Shopping
%>

</body>
</html>

