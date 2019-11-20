
<!DOCTYPE html>
<html>
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
</div>
<head>
        <title>POT-8O Orbital Bombardment Groceries Main Page</title>
        <style>
        
        #button a
        {
                text-decoration: none;
                color: black;
                border: 2px solid rgb(175, 175, 175);
                background-color: rgb(221, 221, 221);
                padding: 9px 9px 9px 9px;
                border-radius: 17px;
        }
        #button table
        {
                margin-left:auto; 
                margin-right:auto;
        }

        #header
        {
                 margin: -10px -10px -10px -10px;
                 background-color: rgb(206, 206, 206);
                 padding: 9px 9px 9px 9px;
                 position: relative;
        }
        #header a
        {
                 padding-right: 20px;
                 font-size: 30px;
                 text-decoration: none;
                 color: black;
        }
        #header a:hover
        {
                 color: rgb(90, 90, 90);
                 font-style: bold;
                }
		</style>
</head>

<body>        
   
<h1 align="center">POT-8O Orbital Bombardment Groceries</h1>

<img src="https://i.imgur.com/RotNh8n.png" alt="POT-8O OBG" width="60%" style='position: relative; left: 20%; right: 20%'>

		<div id='button'>
        	<table><tr><td><h2 align="center"><a href="listprod.jsp?productName=">Begin Shopping</a></h2></td>
        
        	<td><h2 align="center"><a href="listorder.jsp">List All Orders</a></h2></td></tr></table>
        </div>

</body>
</html>
