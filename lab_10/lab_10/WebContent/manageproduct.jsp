<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Manage Products</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>


<!-- =========================Add Product========================= -->>
<h2>Add New Product:</h2>
<br>
<form name="AddProd" method=post action="addproduct.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Name:</font></div></td>
	<td><input type="text" name="productName" size=40 maxlength="40"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Price:</font></div></td>
	<td><input type="number" name="productPrice" size=40 maxlength="10" step=".01" ></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image URL:</font></div></td>
	<td><input type="url" name="productImageURL" size=40 maxlength="1000"></td>
</tr>
<!--<tr>HOW DO I SQL IMAGES REEEEEEEEEEEEEEEEEEEEE
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image:</font></div></td>
	<td><input type="file" name="productImage"></td>
</tr>-->
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Description:</font></div></td>
	<td><input type="text" name="productDesc" size=40 maxlength="1000"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Category ID:</font></div></td>
	<td><input type="number" name="categoryId" size=40 maxlength="10"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Add Product">
</form>

<!-- ===================Update Product Info========================= -->
<h2>Update Product Info</h2>
<br>
<form name="UpdateProd" method=post action="updateproduct.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Id:</font></div></td>
	<td><input type="number" name="productId" size=40 maxlength="1000"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Name:</font></div></td>
	<td><input type="text" name="productName" size=40 maxlength="40"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Price:</font></div></td>
	<td><input type="number" name="productPrice" size=40 maxlength="10" step=".01" ></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image URL:</font></div></td>
	<td><input type="url" name="productImageURL" size=40 maxlength="1000"></td>
</tr>
<!--<tr>HOW DO I SQL IMAGES REEEEEEEEEEEEEEEEEEEEE
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Image:</font></div></td>
	<td><input type="file" name="productImage"></td>
</tr>-->
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Description:</font></div></td>
	<td><input type="text" name="productDesc" size=40 maxlength="1000"></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Category ID:</font></div></td>
	<td><input type="number" name="categoryId" size=40 maxlength="10"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Update Product">
</form>
<!-- ==================Delete Product================== -->
<h2>Delete Product</h2>
<br>
<form name="DeleteProd" method=post action="deleteproduct.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Id:</font></div></td>
	<td><input type="number" name="productId" size=40 maxlength="1000"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Delete Product">
</form>

</body>
</html>