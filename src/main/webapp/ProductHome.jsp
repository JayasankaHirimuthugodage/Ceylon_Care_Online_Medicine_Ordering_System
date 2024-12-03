<!-- ProductHome.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, MedicineOrderingSystem.ProductModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ceylon Care - Online Medicine Ordering System</title>
<link rel="stylesheet" href="styles_hf.css">
<link rel="stylesheet" href="styles_product.css">
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
            <% HttpSession session1 = request.getSession(false);
            if (session1 != null && session1.getAttribute("user") != null) { %>
                <a href="Profile.jsp">Profile</a>
            <% } %>
        </nav>
        <div class="user-actions">
            <a href="upload-prescription.html" class="upload-btn">Upload Prescription</a>
            <a href="cart.jsp">Cart</a>
            <% HttpSession session2 = request.getSession(false);
            if (session2 != null && session2.getAttribute("user") != null) { %>
                <a href="LogoutServlet" class="auth-btn">Logout</a>
            <% } else { %>
                <a href="signup.jsp">Signup</a>
                <a href="login.jsp" class="auth-btn">Login</a>
            <% } %>
        </div>
    </header>

    <main class="main-content">
        <div class="product-grid">
            <% List<ProductModel> products = (List<ProductModel>) request.getAttribute("allProducts");
            if (products != null && !products.isEmpty()) {
                for (ProductModel product : products) { %>
                    <div class="product-card">
                        <img src="<%= request.getContextPath() + "/uploads/" + product.getImageURL() %>" alt="<%= product.getProductName() %>" class="product-image">
                        <h3 class="product-name"><%= product.getProductName() %></h3>
                        <p class="product-description"><%= product.getDescription() %></p>
                        <p class="product-price">$<%= product.getUnitPrice() %></p>
                        
                        
                        <!-- Add to Cart Form -->
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="productId" value="<%= product.getProduct_Id() %>">
                            <button type="submit" class="btn-cart">Add to Cart</button>
                            
                        </form>
                        
                        <div class="product-actions">
                            <button class="btn-wishlist">Wishlist</button>
                            <button class="btn-compare">Compare</button>
                        </div>
                    </div>
            <%   }
            } else { %>
                <p>No products available.</p>
            <% } %>
        </div>
    </main>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | 
           <a href="privacy.html">Privacy Policy</a> | 
           <a href="terms.html">Terms of Service</a>
        </p>
    </footer>
    <script src="script.js"></script>
</body>
</html>
