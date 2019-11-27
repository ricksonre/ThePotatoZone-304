<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>
<%
String authenticatedUser = null;
session = request.getSession(true);

try
{
	authenticatedUser = validateLogin(out,request,session);
}
catch(IOException e)
{	System.err.println(e); }

if(authenticatedUser != null)
	response.sendRedirect("index.jsp");		// Successful login
else
	response.sendRedirect("login.jsp");		// Failed login - redirect back to login page with a message 
%>


<%!
String username = request.getParameter("username");
String password = request.getParameter("password");
		try 
		{
			
			// TODO: Check if userId and password match some customer account. If so, set retStr to be the username.
			String uid = "rreichma";
			String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
			String pw = "69750420";
			Connection con = DriverManager.getConnection(url, uid, pw);
			String query = "INSERT INTO product (productId, productName, productPrice, productImageURL, productImage, productDesc, categoryId) VALUES ('"+productId +"');";	
			System.out.print("pass");
			
			PreparedStatement stat = con.prepareStatement(query);
			ResultSet set = stat.executeQuery();
			System.out.println(set.toString());
			if (set.next()){
				retStr = "";
				System.out.print("pass3");
			}
			
			System.out.print("pass2");
		} 
		catch (SQLException ex) {
			out.println(ex);
		}
		finally
		{
			closeConnection();
		}	
		
	
%>

