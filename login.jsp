<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Car Parking System</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body class="login-page">
    <div class="container">
        <h1 class="login-title">Car Parking System</h1>
        <h2 class="login-subtitle">Login to Continue</h2>

        <% String error = request.getParameter("error");
           if (error != null) { %>
            <p class="error">Invalid email or password. Please try again.</p>
        <% } %>

        <form action="LoginServlet" method="post">
            <input type="text" name="email" placeholder="Enter Email" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="submit" class="btn" value="Login">
        </form>

        <p>Don't have an account? <a href="register.jsp">Register Here</a></p>

        <!-- Admin Login Button -->
        <a href="adminlogin.jsp" class="admin-btn">Admin Login</a>
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
