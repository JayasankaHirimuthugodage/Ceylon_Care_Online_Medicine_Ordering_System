<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="MedicineOrderingSystem.ProductModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ceylon Care - Online Medicine Ordering System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="images/logo.png" alt="Ceylon Care Logo">
            <h1>Ceylon Care</h1>
        </div>
        <nav class="nav-menu">
            <a href="ProductHomeServlet">Home</a> 
            <a href="ProductHomeServlet">Products</a> 
            <a href="aboutUs.jsp">About Us</a>
             <a href="contactUs.jsp">Contact Us</a>
            <%
            HttpSession session1 = request.getSession(false);
            if (session1 != null && session1.getAttribute("user") != null) {
            %>
            <a href="Profile.jsp">Profile</a>
            <%
            }  
            %>
        </nav>
        <div class="user-actions">
            <a href="upload-prescription.html" class="upload-btn">Upload
                Prescription</a> <a href="cart.jsp">Cart</a>

            <%
            HttpSession session2 = request.getSession(false);
            if (session2 != null && session2.getAttribute("user") != null) {
            %>
            <a href="LogoutServlet" class="auth-btn">Logout</a>
            <%
            } else {
            %>
            <a href="signup.jsp">Signup</a> <a href="login.jsp" class="auth-btn">Login</a>
            <%
            }
            %>
        </div>
    </header>

    <main class="main-content">
         <!-- Slideshow section -->
    <div class="slideshow-container">
        <img class="slides fade" src="images/slide1.png" alt="Slide 1">
        <img class="slides fade" src="images/slide2.png" alt="Slide 2">
        <img class="slides fade" src="images/slide3.png" alt="Slide 3">
        <div class="overlay-text">Your one-stop solution for all needs</div>
    </div>

    <!-- Welcome section -->
    <section class="welcome-section">
        <h2>Welcome to Ceylon Care</h2>
        <p>
            At Ceylon Care, we provide a convenient, reliable, and user-friendly online platform for ordering medicines.
            Whether it's for you or your loved ones, we ensure that you get the best service at your fingertips.
        </p>
    </section>

    <!-- Features section -->
    <section class="features-section">
        <div class="feature">
            <img src="images/card1.png" alt="Fast Delivery">
            <h3>Fast Delivery</h3>
            <p>Get your medicines delivered to your doorstep quickly and safely.</p>
        </div>
        <div class="feature">
            <img src="images/card2.png" alt="Secure Payment">
            <h3>Secure Payment</h3>
            <p>We offer a variety of secure payment options for your convenience.</p>
        </div>
        <div class="feature">
            <img src="images/card3.png" alt="Customer Support">
            <h3>24/7 Support</h3>
            <p>Our customer service team is available 24/7 to assist with your needs.</p>
        </div>
    </section>

    <!-- Call to action section -->
    <section class="cta-section">
        <h2>Join Us Today!</h2>
        <p>Sign up now to start ordering your medicines from the comfort of your home.</p>
        <a href="signup.html" class="cta-btn">Get Started</a>
    </section>
    </main>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>
            &copy; 2024 Ceylon Care. All rights reserved. | <a
                href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms
                of Service</a>
        </p>
    </footer>
    <script src="script.js"></script>
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let slides = document.getElementsByClassName("slides");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1;}
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }
    </script>
</body>
</html>
