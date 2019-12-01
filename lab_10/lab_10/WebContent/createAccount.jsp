<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<%@ include file='header.jsp' %>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>POT-8O Orbital Bombardment Groceries</title>
</head>
<body>

<html>
    <br><br>
<div style='border: 2px solid rgb(184, 184, 184); text-align: center; width: 50%; left: 25%;position: relative;'>
    <form action="register.jsp" method='post'>
        <label for="name">First Name: </label>
        <input type="text" name="fname" required>

        <div>
            <label for="name">Last Name: </label>
            <input type="text" name="lname" required>
        </div>
        <div>
            <label for="name">Email: </label>
            <input type="email" name="fname" required>
        </div>
        <div>
            <label for="name">Phone Number: </label>
            <input type="tel" name="pnum" required>
        </div>
        <div>
            <label for="name">Address: </label>
            <input type="text" name="adress" required>
        </div>
        <div>
            <label for="name">City: </label>
            <input type="text" name="city" required>
        </div>
        <div>
            <label for="name">State: </label>
            <input type="text" name="state" required>
        </div>
        <div>
            <label for="name">ZIP: </label>
            <input type="text" name="zip" required>
        </div>
        <div>
            <label for="name">State: </label>
            <input type="text" name="state" required>
        </div>
        <div>
            <label for="name">Country: </label>
            <input type="text" name="country" required>
        </div>
        <div>
            <label for="name">userId: </label>
            <input type="text" name="userid" required>
        </div>
        <div>
            <label for="name">Password: </label>
            <input type="password" name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
            <br>
            at least 8 letters, one capital, and a number
            <br>
        </div>
        <button type='submit'> Create account</button>
    </form>
</div>

</html>