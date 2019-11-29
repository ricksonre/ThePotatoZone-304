<!DOCTYPE html>
<html>

<%@ include file='header.jsp' %>
</div>
<head>
        <title>POT-8O Orbital Bombardment Groceries Main Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>        
   
<h1 align="center">POT-8O Orbital Bombardment Groceries</h1>

<img src="https://i.imgur.com/RotNh8n.png" alt="POT-8O OBG" width="40%" style='position: relative; left: 30%; right: 30%'>

		<div id='button'>
        	<table>
                        <tr>
                                <td>
                                        <h2 align="center">
                                                <a href="listprod.jsp?productName=">Begin Shopping</a>
                                        </h2>
                                </td>
                
                        <td>
                                <h2 align="center">
                                        <a href="listorder.jsp">List All Orders</a>
                                </h2>
                        </td>
                        </tr>
                        <tr>
                                <td>
                                        <h2 align="center">
                                             <%
                                                if(session.getAttribute("authenticatedUser")!=null)
                                                {
                                                        out.println("<a href=\"logout.jsp\">Logout</a>");
                                                }
                                                else
                                                        out.println("<a href=\"login.jsp\">Login</a>");
                                                %>
                                        </h2>
                                </td>
                
                        <td>
                                <h2 align="center">
                                        <%
                                                if(session.getAttribute("authenticatedUser")!=null)
                                                {
                                                        out.println("<a href=\"customer.jsp\">Customer Info</a>");
                                                }

                                        %>
                                </h2>
                        </td>
                        </tr>
                </table>
                <%
	                String userName = (String)session.getAttribute("authenticatedUser");
                        if(userName != null)
                        {
                                out.println("<p style='text-align: center;'>Loged on account: " + userName);
                        }
                %>
        </div>

</body>
</html>
