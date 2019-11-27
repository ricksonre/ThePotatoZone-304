
<%@ page import="java.sql.*" %>
<%

StringBuffer text = new StringBuffer(request.getParameter("textarea1"));

String uid = "rreichma";
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rreichma;";
String pw = "69750420";
Connection con = DriverManager.getConnection(url, uid, pw);



%>

<jsp:forward page="product.jsp" />