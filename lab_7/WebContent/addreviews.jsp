
<%@ page import="java.sql.*"%>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null) {
		StringBuffer text = new StringBuffer(request.getParameter("textarea1"));
		String rating = request.getParameter("command");
		String uid = "rreichma";
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
		String pw = "69750420";
		Connection con = DriverManager.getConnection(url, uid, pw);
		String sql = "SELECT customerId FROM customer WHERE userId LIKE '"
				+ session.getAttribute("authenticatedUser").toString() + "';";
		String name = "";

		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rst = null;
		rst = pstmt.executeQuery();

		rst.next();

		String sqlExists = "SELECT * FROM review WHERE customerId =" + rst.getInt(1);
		pstmt = con.prepareStatement(sqlExists);
		ResultSet rst2 = pstmt.executeQuery();
		if (rst2.next()) {

			sql = "UPDATE review SET reviewRating = ?,reviewComment=? WHERE customerId=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(rating));
			pstmt.setString(2, text.toString());
			pstmt.setInt(3, rst.getInt(1));

			pstmt.executeUpdate();

		} else {

			sql = "INSERT INTO review (reviewRating,customerId,productId,reviewComment) VALUES(?,?,?,?);";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(rating));
			pstmt.setInt(2, rst.getInt(1));
			pstmt.setString(3, session.getAttribute("currentProduct").toString());
			pstmt.setString(4, text.toString());

			System.out.println(rating + text + session.getAttribute("authenticatedUser").toString()
					+ session.getAttribute("currentProduct").toString());
			pstmt.executeUpdate();
		}

		pstmt.close();

	}
%>

<jsp:forward page="product.jsp" />