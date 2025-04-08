<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Car Parking System</title>
    
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body class="register-page">
    <div class="container">
        <h2>Register for Car Parking System</h2>

        <%-- Display success or error message --%>
        <% String message = request.getParameter("message");
           if (message != null && message.equals("success")) { %>
            <p class="success">Registration successful! You can now <a href="login.jsp">Login</a>.</p>
        <% } else if (message != null && message.equals("error")) { %>
            <p class="error">Registration failed. Please try again.</p>
        <% } %>

        <form action="RegisterServlet" method="post">
            <input type="text" name="name" placeholder="Enter Full Name" required><br>
            <input type="email" name="email" placeholder="Enter Email" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="submit" class="btn" value="Register">
        </form>

        <p>Already have an account? <a href="login.jsp">Login Here</a></p>
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
