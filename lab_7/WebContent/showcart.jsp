<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>


<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Your Shopping Cart</title>
</head>

<body>

	<form name="form1">
		<script>
			function update(newid, newqty) {
				window.location = "showcart.jsp?update=" + newid + "&newqty="
						+ newqty;
			}
		</script>

		<%
			// Get the current list of products
			@SuppressWarnings({ "unchecked" })
			HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session
					.getAttribute("productList");
			ArrayList<Object> product2 = new ArrayList<Object>();
			if (!(request.getParameter("update") == null || request.getParameter("update").equals(""))) {
				if (productList.containsKey(request.getParameter("update"))) {
					product2 = (ArrayList<Object>) productList.get(request.getParameter("update"));
					if (request.getParameter("newqty") != "undefined") {
						int curAmount = ((Integer) product2.get(3)).intValue();
						product2.set(3, new Integer(request.getParameter("newqty")));
					}
				}
			} else if (!(request.getParameter("delete") == null || request.getParameter("delete").equals(""))) {

				if (productList.containsKey(request.getParameter("delete"))) {
					productList.remove(request.getParameter("delete"));
				}

			}

			if (productList == null) {
				out.println("<H1>Your shopping cart is empty!</H1>");
				productList = new HashMap<String, ArrayList<Object>>();
			} else {
				NumberFormat currFormat = NumberFormat.getCurrencyInstance();

				out.println("<h1>Your Shopping Cart</h1>");
				out.print("<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
				out.println("<th>Price</th><th>Subtotal</th></tr>");

				double total = 0;
				Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry<String, ArrayList<Object>> entry = iterator.next();
					ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
					if (product.size() < 4) {
						out.println("Expected product with four entries. Got: " + product);
						continue;
					}
					String id = product.get(0).toString();

					out.print("<tr><td>" + id + "</td>");
					out.print("<td>" + product.get(1) + "</td>");

					Object price = product.get(2);
					Object itemqty = product.get(3);
					double pr = 0;
					int qty = 0;

					try {
						pr = Double.parseDouble(price.toString());
					} catch (Exception e) {
						out.println("Invalid price for product: " + product.get(0) + " price: " + price);
					}
					try {
						qty = Integer.parseInt(itemqty.toString());
					} catch (Exception e) {
						out.println("Invalid quantity for product: " + product.get(0) + " quantity: " + qty);
					}
					out.print("<td align=\"center\"><input type=\"text\" name=\"newqty1\" size=\"3\" value=\"" + qty
							+ "\"></td>");
					out.print("<td align=\"right\">" + currFormat.format(pr) + "</td>");
					out.print("<td align=\"right\">" + currFormat.format(pr * qty) + "</td>");
					out.print("<td align=\"right\"><a href=\"showcart.jsp?delete=" + id + "\">Remove Product</a></td>");
					out.print("<td align=\"right\"><input type=\"button\" onclick=\"update(" + id
							+ ",  document.form1.newqty1.value)\" value=\"Update Quantity\"></td>");
					out.println("</tr>");
					total = total + pr * qty;
				}
				out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>" + "<td align=\"right\">"
						+ currFormat.format(total) + "</td></tr>");
				out.println("</table>");

				out.println("<h2 id='button'><a href=\"checkout.jsp\">Check Out</a></h2>");
			}
		%>
		<h2 id='button'>
			<a href="listprod.jsp?productName=">Continue Shopping</a>
		</h2>
	</form>
</body>
</html>

