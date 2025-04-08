<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parking Availability</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body class="parking-body">

    <!-- Slideshow Background -->
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

    <!-- Parking Info Box -->
    <div class="parking-box">
        <h2>🚘 Parking Availability</h2>
        <%
            int totalSpots = 50;
            int occupiedSpots = 0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carparkingdb", "root", "root");
                PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM checkin");
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    occupiedSpots = rs.getInt(1);
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            int availableSpots = totalSpots - occupiedSpots;
        %>

        <p><strong>Total Parking Spots:</strong> <%= totalSpots %></p>
        <p><strong>Occupied Spots:</strong> <%= occupiedSpots %></p>
        <p><strong>Available Spots:</strong> 
            <span class="<%= (availableSpots > 0) ? "available" : "full" %>">
                <%= availableSpots %>
            </span>
        </p>

        <div class="parking-links">
            <a href="checkin.jsp" class="link-btn">Check-in</a>
            <a href="checkout.jsp" class="link-btn">Check-out</a>
        </div>
    </div>

</body>
</html>
