
<%@ page import="java.sql.*"%>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null) {
		StringBuffer text = new StringBuffer(request.getParameter("textarea1"));

		String uid = "rreichma";
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
		String pw = "69750420";
		Connection con = DriverManager.getConnection(url, uid, pw);
		
		String sql = "INSERT INTO reviews (productId, content,cname,rating) VALUES (?, ?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt = con.prepareStatement(sql);		
		pstmt.setString(1,session.getAttribute("currentProduct").toString());
		pstmt.setString(2,formatter.format(date));
		pstmt.setDouble(3,sum);
		
		pstmt.executeUpdate();
		

	}
%>

<jsp:forward page="product.jsp" />