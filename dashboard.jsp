<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body class="dashboard-body">
    <div class="dashboard-container">
        <h1>Welcome, <%= session1.getAttribute("userName") %> 👋</h1>
        <div class="dashboard-buttons">
            <a href="parking.jsp" class="dash-btn">Check Parking</a>
            <a href="checkin.jsp" class="dash-btn">Check-in</a>
            <a href="checkout.jsp" class="dash-btn">Check-out</a>
            <a href="logout.jsp" class="logout-btn">Logout</a>
        </div>
    </div>

    <div class="slideshow-container">
        <img src="images/car1.jpg" alt="Car 1">
        <img src="images/car2.jpg" alt="Car 2">
        <img src="images/car3.jpg" alt="Car 3">
        <img src="images/car4.jpg" alt="Car 4">
        <img src="images/car5.jpg" alt="Car 5">
        <img src="images/car6.jpg" alt="Car 6">
        <img src="images/car7.jpg" alt="Car 7">
        <img src="images/car8.jpg" alt="Car 8">
        <img src="images/car9.jpg" alt="Car 9">
        <img src="images/car10.jpg" alt="Car 10">
    </div>
</body>
</html>
