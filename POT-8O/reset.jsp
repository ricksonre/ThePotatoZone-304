<%@ include file='header.jsp' %>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	out.println("aaaa");

    getConnection();

		String fileName = "data/orderdb_sql.ddl";
		
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
	            try
	            {
	            	stmt.execute(command);
	            }
	        }	 
	        scanner.close();
	    }

%>

</body>
</html>

