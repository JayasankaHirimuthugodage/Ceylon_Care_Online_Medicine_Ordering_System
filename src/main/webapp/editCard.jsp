<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="MedicineOrderingSystem.Card"%>
<%
    Card card = (Card) request.getAttribute("card");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Care - Online Medicine Ordering System</title>
    <link rel="stylesheet" href="styles_hf.css">

    <style>
    /* Existing styles */
    h2 {
        color: #2c3e50;
        font-weight: 600;
        text-align: center;
        margin-bottom: 20px;
    }
    form {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px; /* Reduced padding to decrease height */
        max-width: 400px;
        margin: auto;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    input[type="text"], input[type="date"] {
        width: calc(100% - 24px);
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
    }
    input[type="submit"] {
        background-color: #27ae60;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: bold;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #229954;
    }
</style>


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
            <a href="upload-prescription.html" class="upload-btn">Upload Prescription</a>
            <a href="cart.jsp">Cart</a>
            <%
                HttpSession session2 = request.getSession(false);
                if (session2 != null && session2.getAttribute("user") != null) {
            %>
            <a href="LogoutServlet" class="auth-btn">Logout</a>
            <%
                } else {
            %>
            <a href="signup.jsp">Signup</a>
            <a href="login.jsp" class="auth-btn">Login</a>
            <%
                }
            %>
        </div>
    </header>

    <h2>Edit Card Details</h2>
    <form name="cardForm" action="card" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="<%= card.getId() %>"/>
        <label>Card Number:</label>
        <input type="text" name="card_number" value="<%= card.getCardNumber() %>" required/>
        <label>Card Holder Name:</label>
        <input type="text" name="card_holder_name" value="<%= card.getCardHolderName() %>" required/>
        <label>Expiration Date:</label>
        <input type="date" name="expiration_date" value="<%= card.getExpirationDate() %>" required/>
        <label>CVV:</label>
        <input type="text" name="cvv" value="<%= card.getCvv() %>" required/>
        <input type="submit" value="Update Card"/>
    </form>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>
    <script src="script.js"></script>
</body>
</html>
