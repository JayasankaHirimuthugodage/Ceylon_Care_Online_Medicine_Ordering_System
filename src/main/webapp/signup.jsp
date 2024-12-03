<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Care - Online Medicine Ordering System</title>
    <link rel="stylesheet" href="styles_hf.css">
    <link rel="stylesheet" href="styles_signup.css">
</head>
<body>
    <header class="header">
    <div class="logo">
        <img src="images/logo.png" alt="Ceylon Care Logo">
        <h1>Ceylon Care</h1>
    </div>
    <nav class="nav-menu">
        <a href="home.jsp">Home</a> 
        <a href="ProductHomeServlet">Products</a> 
        <a href="aboutUs.jsp">About Us</a> 
        <a href="contactUs.jsp">Contact Us</a>
             <%
            HttpSession session1 = request.getSession(false); // Do not create new session
            if (session1 != null && session1.getAttribute("user") != null) {
                // User is logged in, show logout button
        %>
        <a href="Profile.jsp">Profile </a>
        <%
            }  
        %>
    </nav>
    <div class="user-actions">
        <a href="upload-prescription.html" class="upload-btn">Upload Prescription</a> 
        <a href="cart.jsp">Cart</a>
        <a href="signup.jsp">Signup</a>
         <!-- Dynamic Login/Logout Button -->
        <%
            HttpSession session2 = request.getSession(false); // Do not create new session
            if (session2 != null && session2.getAttribute("user") != null) {
                // User is logged in, show logout button
        %>
            <a href="LogoutServlet" class="auth-btn">Logout</a>
        <%
            } else {
                // User is not logged in, show login button
        %>
            <a href="login.jsp" class="auth-btn">Login</a>
        <%
            }
        %>
    </div>
</header>

    <main class="main-content">
        <div class="container">
        
        <%
            HttpSession session5 = request.getSession(false); // Do not create new session
            if (session5 != null && session5.getAttribute("user") != null) {
                // User is logged in, show logout button
        %>
        You have already logged in .Please <a href="LogoutServlet">logout</a>
        
         <%
            } else {
                // User is not logged in, show login button
        %>
<h1>Registration Form</h1>
            <form action="RegisterServlet" method="post">
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="delivery address">Delivery Address</label>
                    <input type="text" id="dadress" name="daddress"  >
                </div>
                

                <button type="submit" class="submit-btn">Register</button>
            </form> 
          <%
            }
        %>
            
        </div>
    </main>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>

    <script src="script.js"></script>
</body>
</html>
