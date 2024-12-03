<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="MedicineOrderingSystem.UserModel" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Care - User Profile</title>
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
                HttpSession session4 = request.getSession(false); // Do not create new session
                if (session != null && session.getAttribute("user") != null) {
            %>
            <a href="Profile.jsp">Profile</a>
            <% } %>
        </nav>
        <div class="user-actions">
            <a href="upload-prescription.html" class="upload-btn">Upload Prescription</a> 
            <a href="cart.jsp">Cart</a>
             <%
                if (session != null && session.getAttribute("user") != null) {
            %>
                <a href="LogoutServlet" class="auth-btn">Logout</a>
            <% } else { %>
                <a href="login.jsp" class="auth-btn">Login</a>
            <% } %>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <h1>Your Profile</h1>
            <%
                // Retrieve session and check if user is logged in
                if (session == null || session.getAttribute("user") == null) {
                    response.sendRedirect("login.jsp");
                    return; // Stop further processing
                }
                
                UserModel user = (UserModel) session.getAttribute("user");
            %>
            <form action="ProfileServlet" method="post">
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required>
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" value="<%= user.getLastName() %>" required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() %>" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                </div>
                
                <div class="form-group"> 
                    <label for="daddress">Delivery Address:</label> 
                    <input type="text" id="daddress" name="daddress" value="<%= user.getDaddress() %>" required> 
                </div> 

                <button type="submit" class="submit-btn">Update Profile</button>
            </form>
        </div>
    </main>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>

    <script src="script.js"></script>
</body>
</html>
