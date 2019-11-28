<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- > Global page header <-->

<div id="header">
        <a href="index.jsp">Home</a>
        <a href="listprod.jsp?productName=">Products</a>
        <a href="showcart.jsp">Shopping Cart</a>
        <a href="listorder.jsp">Orders</a>
<%
	//if the user is logged display relevant information on header (customer information, admin page, loged username, logout)
	//	if not display button to log into
	if(session.getAttribute("authenticatedUser")!=null)
	{
		out.print("<a href=\"customer.jsp\">Customer Info</a>");
		out.print("<a href=\"admin.jsp\">Admin</a>");
		out.print("<p >You are loged as " + session.getAttribute("authenticatedUser") + "</p> ");
		out.print("<a style='text-align: right;' href=\"logout.jsp\">Logout</a>");
	}
	else
		out.print("<a href=\"login.jsp\">Login</a>");

%>
</div>