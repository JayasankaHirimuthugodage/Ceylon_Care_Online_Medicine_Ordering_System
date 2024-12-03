<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="MedicineOrderingSystem.ProductModel" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Care - Cart</title>
    <link rel="stylesheet" href="styles_hf.css">
    <link rel="stylesheet" href="styles_cart.css">
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
            HttpSession session20 = request.getSession(false);
            if (session20 != null && session20.getAttribute("user") != null) {
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
            if (session20 != null && session20.getAttribute("user") != null) {
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

    <main class="main-content">
        <h2>Your Cart</h2>
        <div class="cart-items">
            <%
            ArrayList<ProductModel> cart = (ArrayList<ProductModel>) session20.getAttribute("cart");
            double total = 0.0;

            if (cart != null && !cart.isEmpty()) {
                for (ProductModel item : cart) {
                    total += item.getUnitPrice();
                    %>
                    <div class="cart-item">
                        <img src="uploads/<%= item.getImageURL() %>" alt="Product Image"> <!-- Updated image path -->
                        <div class="item-details">
                            <h3><%= item.getProductName() %></h3>
                            <p>Price: $<%= item.getUnitPrice() %></p>
                            <p>Quantity: 1</p>
                            <!-- Form to remove item from cart -->
                            <form action="RemoveFromCartServlet" method="post">
                                <input type="hidden" name="productId" value="<%= item.getProduct_Id() %>">
                                <button type="submit" class="remove-btn">Remove</button>
                            </form>
                        </div>
                    </div>
                    <%
                }
            } else {
                %>
                <p>Your cart is empty.</p>
                <%
            }
            %>
        </div>
        <div class="cart-total">
            <p>Total: $<%= total %></p>
<button class="checkout-btn" onclick="location.href='cardInput.jsp';">Add Card Details</button>        </div>
    </main>
    
    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>
</body>
</html>
