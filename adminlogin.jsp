<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body class="admin-login" >
    <div class="container">
       <form action="AdminLoginServlet" method="post">
    <label>Username:</label>
    <input type="text" name="username" required>
    
    <label>Password:</label>
    <input type="password" name="password" required>
    
    <button type="submit">Login</button>
</form>



<% 
    String error = request.getParameter("error");
    if (error != null) { 
%>
    <p style="color: red;"><%= error %></p>
<% } %>

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
