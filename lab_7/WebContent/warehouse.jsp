<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var newWarehouseId
$(document).ready(function() {
	//Page Setup. Sets Current Warehouse if previously selected before getting redirected here.
	newWarehouseId = <% out.print(request.getParameter("newWarehouseId")); %>
	console.log(newWarehouseId);
	if(newWarehouseId!=null){
		console.log('test1');
		curWarehouse = "w" + newWarehouseId;
		currentWarehouse(curWarehouse);
	}
	else {
		console.log('test2');
		currentWarehouseUpdate()
	}
});

//Shows/Hides Relevant/Irrelevant table rows
function currentWarehouse(warehouseId) {
	$('.item').hide();
	if(warehouseId!=null) {
		$('.'+warehouseId).show();
	}
}

//Updates current warehouse shown from warehouse_selector
function currentWarehouseUpdate() {
	var selected = $('#warehouse_selector').val();
	if(selected!=""){
		currentWarehouse(selected);
	}
	else {
		currentWarehouse(null);
	}
}

</script>
<meta charset="ISO-8859-1">
<title>warehouse</title>
</head>
<body>
<%@ include file="auth.jsp"%>

<h1> Warehouse</h1>

<%
System.out.println("warehouse.jsp");

//Database Connection Setup
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
String uid = "rreichma";
String pw = "69750420";
Connection con = DriverManager.getConnection(url, uid, pw);

//Set Session info
session = request.getSession(true);
String newWarehouseId = request.getParameter("newWarehouseId");
String newProductId = request.getParameter("newProductId");
String newQuantity = request.getParameter("newQuantity");

//Updates database if redirected from update button
if(!(newWarehouseId==null||newProductId==null||newQuantity==null)){
	String queryCheck = "select * from productinventory where productId=" + newProductId + "and warehouseId=" + newWarehouseId;
	PreparedStatement stat = con.prepareStatement(queryCheck);
	ResultSet check = stat.executeQuery();
	if(!check.next()) {
		System.out.println("Inserting into database");
		String add = "insert into productinventory (productId,warehouseId,quantity) values("+newProductId+","+newWarehouseId+","+newQuantity+");";
		PreparedStatement addInventory = con.prepareStatement(add);
		addInventory.execute();
	}
	else{
		System.out.println("Updating database");
		String update = "update productinventory set quantity="+newQuantity+"where productId="+newProductId+"and warehouseId="+newWarehouseId;
		PreparedStatement updateInventory = con.prepareStatement(update);
		updateInventory.execute();
	}
}

//select warehouse/product/productinventory from database for table
String query = "select w.warehouseId, w.warehouseName, p.productName, p.productImageURL, pi.quantity, p.productId from warehouse as w cross join product as p left join productinventory as pi on w.warehouseId=pi.warehouseId and pi.productId=p.productId";
PreparedStatement stat = con.prepareStatement(query);
ResultSet set = stat.executeQuery();

//select warehouse for title
String querywarehouse = "select * from warehouse";
stat = con.prepareStatement(querywarehouse);
ResultSet setw = stat.executeQuery();

//select warehouse for warehouse_selector
String querywarehouse2 = "select * from warehouse";
stat = con.prepareStatement(querywarehouse);
ResultSet setw2 = stat.executeQuery();

//warehouse_selector
String selectdisplay = "<h2>Select A Warehouse:</h2><select id='warehouse_selector' onchange='currentWarehouseUpdate()'>";
selectdisplay += "<option></option>";
while(setw2.next()) {
	selectdisplay += 
			"<option value='w" + setw2.getString("warehouseId") + "'>" + setw2.getString("warehouseName") + "</option>";
}
selectdisplay += "</select>";
out.print(selectdisplay);

//table 
String display = "";
while(setw.next()) {
	String currentWarehouse = setw.getString("warehouseId");
	display += "<h2 class='w"+ setw.getString("warehouseId") +" item'>Warehouse: "+ setw.getString("warehouseName") +"</h2>";
}
display += "<table>";
display += "<tr><th>Image</th><th>Product Name</th><th>Quantity</th></tr>";
while(set.next()) {
	display += 
			"<tr class='w"+ set.getString("warehouseId") +" item'>" +
			"<td><img width=75 height=75 src=" + set.getString("productImageURL") + "></td>" +
			"<td align='middle'>" + set.getString("productName") + "</td>" +
			"<form name='updateWarehouse' method='POST' action='warehouse.jsp'>" +
			"<td align='middle'><input size='5' type='number' name='newQuantity' value='" + (set.getString("quantity")==null ? 0 : set.getString("quantity")) + "'></input></td>" +
			"<td>" + 
			"<input type='submit' value='Update'></input>" +
			"<input type='hidden' name='newWarehouseId' value='"+ set.getString("warehouseId") +"'></input>" +
			"<input type='hidden' name='newProductId' value='" + set.getString("productId") + "'></input>" +
			"</form></td>"+
			"</tr>";
}
display += "</table>";
out.print(display);
%>

</body>
</html>
