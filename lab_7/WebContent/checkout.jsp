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
<title>Ray's Grocery CheckOut Line</title>
</head>
<body>

<h1>Enter your customer id to complete the transaction:</h1>

<form method="get" action="order.jsp">
<input type="text" name="customerId" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>

</body>
</html>

