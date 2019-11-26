<link rel="stylesheet" type="text/css" href="css/style.css">

<div id="header">
        <a href="index.jsp">Home</a>
        <a href="listprod.jsp?productName=">List of Products</a>
        <a href="showcart.jsp">Shopping Cart</a>
        <a href="listorder.jsp">List of Orders</a>
<%
	{
	String userName = (String)session.getAttribute("authenticatedUser");
	if(userName != null)
	{
		out.println("<a href=\"customer.jsp\">Customer Info</a>");
		out.println("<a href=\"admin.jsp\">Admin</a>");
		out.println("<p style='text-align: right;'>" + userName + ",<p>");
		out.println("<a style='text-align: right; href=\"logout.jsp\">Logout</a>");
	}
	else
		out.println("<a style='text-align: right; href=\"login.jsp\">Login</a>");
	}
%>
</div>
