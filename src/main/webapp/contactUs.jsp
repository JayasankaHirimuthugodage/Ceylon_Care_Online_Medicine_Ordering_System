<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Ceylon Care - Online Medicine Ordering System</title>
<link rel="stylesheet" href="contactUs.css">

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
                if (session.getAttribute("user") != null) {
            %>
                <a href="Profile.jsp">Profile</a>
            <%
                }
            %>
            
        </nav>
        
        <div class="user-actions">
		    <a href="" class="upload-btn">Upload Prescription</a>
		    <a href="cart.jsp">Cart</a>
		
		    <%
		        if (session.getAttribute("user") != null) {
		    %>
		        <!-- If the user is logged in, show the Logout button -->
		        <a href="LogoutServlet">Logout</a>
		    <%
		        } else {
		    %>
		        <!-- If the user is not logged in, show Sign Up and Log In buttons -->
		        <a href="signup.jsp">Sign Up</a>
		        <a href="login.jsp">Log In</a>
		    <%
		        }
		    %>
		</div>
		
    </header>
				  
	<main class="main-content">
        <h2>Contact Us</h2>
        <form action="MessageInsert" method="post" class="contact-form">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="opEmail">Email:</label>
                <input type="email" id="opEmail" name="opEmail" required>
            </div>
            <div class="form-group">
                <label for="description">Description (Message):</label>
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>
            <div class="form-group button-group">
                <button type="submit" class="submit-btn" name="submit">Submit</button>
                <a href="MessageRead" class="view-messages-btn">View and Update Message</a>
            </div>
        </form>
    </main>
	
	<footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>
	
</body>
</html>