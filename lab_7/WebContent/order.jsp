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

</style>
<style>
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

<div id="header">
        <a href="shop.html">Home</a>
        <a href="listprod.jsp?productName=">List of Products</a>
        <a href="showcart.jsp">Shopping Cart</a>
		<a href="listorder.jsp">List of Orders</a>
</div>

<head>
<title>YOUR NAME Grocery Order Processing</title>
</head>
<body>

	<% 
// Get customer id
String custId = request.getParameter("customerId");
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

try{
if(custId!= null & !custId.equals("")){

// Determine if valid customer id was entered
// Determine if there are products in the shopping cart
// If either are not true, display an error message

// Make connection

// Save order information to database
	
	String uid = "rreichma";
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
	String pw = "69750420";
	Connection con = DriverManager.getConnection(url, uid, pw);
	String sql = "SELECT firstName,lastName FROM customer WHERE customerId LIKE '"+custId+"';";
	String name = "";
	//String sql2 = "SELECT * FROM customer WHERE customerId ="+custId;
	
	
	
	// Use retrieval of auto-generated keys.
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rst = null;
	rst = pstmt.executeQuery();
	
	if(rst.next()){
		out.println("<H2>"+"Your Order Summary"+"</H2>");
		name=rst.getString(1)+" "+rst.getString(2);
		
		
		

	// Insert each item into OrderProduct table using OrderId from previous INSERT

	// Update total amount for order record

	// Here is the code to traverse through a HashMap
	// Each entry in the HashMap is an ArrayList with item 0-id, 1-name, 2-quantity, 3-price
	
	double sum=0;

	
	
		Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
		
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		
		String sql2 = "INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (?, ?, ?)";
		pstmt = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);
		
		pstmt.setString(1,custId);
		pstmt.setString(2,formatter.format(date));
		pstmt.setDouble(3,sum);
		
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
			sum+=pr*qty;
			
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
		out.println("<h1>Order completed.  Will be shipped soon...</h1><h1>Your order reference number is: "+orderId+"</h1><h1>Shipping to customer: "+custId+" Name: "+name+"</h1><h2 id='button'><a href=\"shop.html\">Return to shopping</a></h2>");
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

