<!DOCTYPE html>
<html>
<head>
        <title>Ray's Grocery Main Page</title>
</head>
<body>
<h1 align="center">Welcome to Ray's Grocery</h1>

<h2 align="center"><a href="login.jsp">Login</a></h2>

<h2 align="center"><a href="listprod.jsp?productName=">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

<h2 align="center"><a href="customer.jsp">Customer Info</a></h2>

<h2 align="center"><a href="admin.jsp">Administrators</a></h2>

<h2 align="center"><a href="logout.jsp">Log out</a></h2>



<%
// TODO: Display user name that is logged in (or nothing if not logged in)	
	if(session.getAttribute("authenticatedUser")!=null)
		out.println("<h2 align=\"center\">Welcome to the Shop, dear "+ session.getAttribute("authenticatedUser")+"</h2>");
	else{
		out.println("<h2 align=\"center\">You are not logged in</h2>");
	}
%>
</body>
</head>


