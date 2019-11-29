<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>YOUR NAME Grocery Order Processing</title>
</head>
<body>

	<% 
// Get customer id
String custId = request.getParameter("customerId");
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

try{

// Determine if valid customer id was entered
// Determine if there are products in the shopping cart
// If either are not true, display an error message
if(custId!= null & !custId.equals("")){

	// Make connection
	String uid = "rreichma";
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
	String pw = "69750420";
	Connection con = DriverManager.getConnection(url, uid, pw);

	// query first and last name from a user from the db
	String sql = "SELECT firstName,lastName FROM customer WHERE customerId LIKE '"+custId+"';";
	String name = "";

	// Use retrieval of auto-generated keys.
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rst = null;
	rst = pstmt.executeQuery();
	
	// loops through the result set and get the customer name
	if(rst.next()){
		out.println("<H2>"+"Your Order Summary"+"</H2>");
		name=rst.getString(1)+" "+rst.getString(2);

	double sum=0;

	
		//iterates the product list
		Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
		
		//format to display the date
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//get the current date
		Date date = new Date(System.currentTimeMillis());
		
		//insert order into order summary
		String sql2 = "INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (?, ?, ?)";
		pstmt = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);
		
		//set information to be inserted into the db
		pstmt.setString(1,custId);
		pstmt.setString(2,formatter.format(date));
		pstmt.setDouble(3,sum);
		
		//executes the query
		pstmt.executeUpdate();
		
		
		ResultSet keys = pstmt.getGeneratedKeys();
		keys.next();
		int orderId = keys.getInt(1);
		
		out.println("<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Subtotal</th></tr>");
		
		while (iterator.hasNext())
		{ 
			Map.Entry<String, ArrayList<Object>> entry = iterator.next();
			ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
			String productId = (String) product.get(0);
	        String price = (String) product.get(2);
	        
			double pr = Double.parseDouble(price);
			
			int qty = ( (Integer)product.get(3)).intValue();
			sum=pr*qty;
			
			String sql3= "INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (?,?,?,?);";
			PreparedStatement pstmt2 = con.prepareStatement(sql3);
			System.out.println("orderID:"+orderId+" ProductID:"+productId+" Quantity:"+qty+" Price:"+pr);
			System.out.println(productList.toString());
			pstmt2.setInt(1,orderId);
			pstmt2.setString(2,productId);
			pstmt2.setInt(3,qty);
			pstmt2.setDouble(4,pr);
			pstmt2.executeUpdate();
			out.println("<tr><td>"+productId+"</td><td>"+(String) product.get(1)+"</td><td align=\"center\">"+qty+"</td><td align=\"right\">$"+pr+"</td><td align=\"right\">$"+sum+"</td></tr></tr>");
	            
		}
		
		String sql4 = "UPDATE ordersummary SET totalAmount=? WHERE orderId=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql4);
		pstmt2.setDouble(1,sum);
		pstmt2.setInt(2,orderId);
		pstmt2.executeUpdate();
		out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td><td aling=\"right\">$"+sum+"</td></tr>");
		out.println("<h1>Order completed.  Will be shipped soon...</h1><h1>Your order reference number is: "+orderId+"</h1><h1>Shipping to customer: "+custId+" Name: "+name+"</h1><h2 id='button'><a href=\"index.jsp\">Return to shopping</a></h2>");
		session.setAttribute("productList",new HashMap<String, ArrayList<Object>>());
		
	}else{
		out.println("<H1>Invalid Order</H1>");
	}
	
	
	con.close();
	
	}else{
		out.println("<H1>Invalid Order</H1>");
	}
}catch(Exception e){
	out.println("<H1>Invalid Order</H1>");
}

// Print out order summary

// Clear cart if order placed successfully
	
	

	
%>
</BODY>
</HTML>

