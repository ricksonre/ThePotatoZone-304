<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%
	// Get the current list of products
	@SuppressWarnings({"unchecked"})
	HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

	if (productList == null)
	{	// No products currently in list.  Create a list.
		productList = new HashMap<String, ArrayList<Object>>();
	}

	try
	{	// Load driver class
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch (java.lang.ClassNotFoundException e)
	{
		out.println("ClassNotFoundException: " +e);
	}
	//Make connection
			String uid = "rreichma";
			String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
			String pw = "69750420";
			Connection con = DriverManager.getConnection(url, uid, pw);
	// Get product information
			String id = request.getParameter("id");
	// Write query to retrieve all order summary records
			StringBuilder output = new StringBuilder();
			String query = "SELECT productName, productPrice FROM product WHERE productId = " +id;
			Statement stat = con.createStatement();
			ResultSet set = stat.executeQuery(query);
			ResultSetMetaData meta = set.getMetaData();
			set.next();
	// Add new product selected
			String name = set.getString(1);
			String price = set.getString(2);
			Integer quantity = new Integer(1);
	// Store product information in an ArrayList
	ArrayList<Object> product = new ArrayList<Object>();
	product.add(id);
	product.add(name);
	product.add(price);
	product.add(quantity);

	// Update quantity if add same item to order again
	if (productList.containsKey(id))
	{	product = (ArrayList<Object>) productList.get(id);
		int curAmount = ((Integer) product.get(3)).intValue();
		product.set(3, new Integer(curAmount+1));
	}
	else
		productList.put(id,product);

	session.setAttribute("productList", productList);

	con.close();
%>
<jsp:forward page="showcart.jsp" />