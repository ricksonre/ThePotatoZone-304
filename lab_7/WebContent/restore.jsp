<!DOCTYPE html>
<html>
<%@ page language="java" import="java.io.*,java.sql.*,java.util.*"%>
<%@ include file="jdbc.jsp" %>
<%@ include file='header.jsp' %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RESTORE!</title>
</head>
<body>
<%
session = request.getSession(true);
String confirm = request.getParameter("confirm");

String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
String uid = "rreichma";
String pw = "69750420";
Connection con = DriverManager.getConnection(url, uid, pw);
String fileName = "orderdb_sql.ddl";
if(confirm.equals("RESTORE"))
  {
try
{
    // Create statement
    Statement stmt = con.createStatement();
    
    Scanner scanner = new Scanner(new File(fileName));
    // Read commands separated by ;
    scanner.useDelimiter(";");
    while (scanner.hasNext())
    {
        String command = scanner.next();
        if (command.trim().equals(""))
            continue;
        System.out.println(command);        // Uncomment if want to see commands executed
        try
        {
        	stmt.execute(command);
        }
        catch (Exception e)
        {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
        	System.out.println(e);
        }
    }	 
    scanner.close();
    out.println("<h2>DATABASE RESTORED!</h2>");
	System.out.println("Closing database connection.");
	try
	{
		if (con != null)
            con.close();
	}
	catch (SQLException e)
	{
		System.out.println(e);
	}
    System.out.println("Database loaded.");
}
catch (Exception e)
{
    System.out.println(e);
}
  }
else
	{
	 out.println("<h2>DATABASE NOT RESTORED</h2>");
	 out.println("<img src=\"https://i.imgur.com/fijYhTE.png\" alt=\"POT-8O OBG\" height=\"40%\" style='position: relative; left: 20%; right: 20%'>");
	}
	
%>
</body>
</html>