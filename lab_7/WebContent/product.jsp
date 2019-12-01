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

//gets the product id from the get request
String productId = "";
if (request.getParameter("id") == null) {
	productId = session.getAttribute("currentProduct").toString();
} else {
	productId = request.getParameter("id");
	}
//connects to the db
getConnection();

//select all information about the product from the id selected
String query =  "SELECT * FROM product WHERE productId=?";	
System.out.print("pass");

//prepares the query and executes it
PreparedStatement stat = con.prepareStatement(query);
stat.setString(1, productId);
ResultSet set = stat.executeQuery();

//as the id is unique goes to index 1
set.next();

//currency formating
NumberFormat currFormat = NumberFormat.getCurrencyInstance();

//prints name of the product and below it a image of the product
out.print("<h2>"+set.getString(2)+"</h2><table>"
    +"<tr> "
        +"<td>" 
            +(set.getString(4)==null?"":("<img width=150 height=150 src=\""+set.getString(4)+"\">")) 
        +"</td>"
        +"<td>");
//display image from the db
out.print("<img src='displayImage.jsp?id=" + productId +"'>");

// prints all other informations about the product (description, price, ...)
out.print("</td>"
    +"</tr>"
    +"<tr>"
        +"<th>Id</th><td>" +set.getString(1)
    +"</td></tr>"
        +"<tr><th>Price</th><td>"+ currFormat.format(set.getDouble(3))+"</td></tr>"
        + "<tr><td>"+set.getString(2)+"</td></tr>"
    +"</table>");
//display buttons to add item to the cart
out.print("<h3><a href=\"addcart.jsp?id="+set.getString(1)+"&name="+set.getString(2)+"&price="+set.getString(3)+"\">Add to Cart</a></h3>");
//button to resturn to the list of products
out.print("<h3><a href=\"listprod.jsp?productName=\">Continue Shopping</a>");

%>

</body>
</html>

