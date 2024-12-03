 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ceylon Care - Online Medicine Ordering System</title>
<link rel="stylesheet" href="styles_hf.css">

</head>
<body>
	<header class="header">
    <div class="logo">
        <img src="images/logo.png" alt="Ceylon Care Logo">
        <h1>Ceylon Care</h1>
    </div>
    <nav class="nav-menu">
        <a href="index.html">Home</a> 
        <a href="products.html">Products</a> 
        <a href="about.html">About Us</a> 
        <a href="contact-us.html">Contact Us</a>
    </nav>
    <div class="user-actions">
        <a href="upload-prescription.html" class="upload-btn">Upload Prescription</a> 
        <a href="cart.html">Cart</a>
        <a href="signupfinal.html">Signup</a>
        
        <!-- Dynamic Login/Logout Button -->
        <%
            HttpSession session6 = request.getSession(false); // Do not create new session
            if (session != null && session.getAttribute("user") != null) {
                // User is logged in, show logout button
        %>
            <a href="logoutServlet" class="auth-btn">Logout</a>
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

	<main class="main-content"></main>
	<footer class="footer">
		<p>200/9, Devananda Road, Piliyandala</p>
		<p>
			&copy; 2024 Ceylon Care. All rights reserved. | <a
				href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms
				of Service</a>
		</p>
	</footer>
	<script src="script.js"></script>
</body>
</html>
