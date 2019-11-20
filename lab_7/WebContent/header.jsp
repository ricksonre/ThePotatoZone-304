<link rel="stylesheet" type="text/css" href="css/style.css">

<div id="header">
        <a href="shop.html">Home</a>
        <a href="listprod.jsp?productName=">List of Products</a>
        <a href="showcart.jsp">Shopping Cart</a>
        <a href="listorder.jsp">List of Orders</a>
<%
	if(session.getAttribute("authenticatedUser")!=null)
	{
		out.println("<a href=\"customer.jsp\">Customer Info</a>");
		out.println("<a href=\"admin.jsp\">Admin</a>");
		out.println("<a href=\"logout.jsp\">Logout</a>");
	}
	else
		out.println("<a href=\"login.jsp\">Login</a>");
%>