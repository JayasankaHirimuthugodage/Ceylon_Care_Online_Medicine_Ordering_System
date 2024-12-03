<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="MedicineOrderingSystem.Card"%>
<%@ page import="MedicineOrderingSystem.CardDAO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
    // Get the current session
    HttpSession session1 = request.getSession(false);
    MedicineOrderingSystem.UserModel user = (session1 != null) ? (MedicineOrderingSystem.UserModel) session1.getAttribute("user") : null;

    // If the user is not logged in, redirect to the login page
    if (user == null || user.getEmail() == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get the user's email
    String userEmail = user.getEmail();

    // Fetch the card details for the logged-in user
    CardDAO cardDAO = new CardDAO();
    List<Card> cards = cardDAO.getCardsByEmail(userEmail);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Care - Online Medicine Ordering System</title>
    <link rel="stylesheet" href="styles_hf.css">

    <style>
        h2 {
            color: #2c3e50;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            margin-top: 20px;
            padding: 0 20px;
        }
        .card-item {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: left;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .card-item h3 {
            margin: 0 0 10px;
            font-size: 20px;
            color: #3498db;
        }
        .card-details p {
            margin: 8px 0;
            color: #555;
            font-size: 14px;
        }
        .card-details p strong {
            font-weight: 600;
        }
        .actions {
            margin-top: 15px;
            text-align: center;
        }
        .actions a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 6px;
            font-size: 14px;
            margin-right: 5px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .edit-button {
            background-color: #27ae60;
        }
        .edit-button:hover {
            background-color: #229954;
        }
        .delete-button {
            background-color: #e74c3c;
        }
        .delete-button:hover {
            background-color: #c0392b;
        }
        .add-card-link {
            display: inline-block;
            margin-top: 30px;
            margin-left: 20px;
            padding: 8px 12px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            text-align: center;
            font-weight: 600;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .add-card-link:hover {
            background-color: #1a5987;
        }
        .footer {
            margin-top: 40px;
            text-align: center;
            padding: 20px;
            background-color: #2c3e50;
            color: #ecf0f1;
        }
        .footer p {
            margin: 5px 0;
        }
        .footer a {
            color: #ecf0f1;
            text-decoration: none;
            font-weight: 500;
        }
        .footer a:hover {
            text-decoration: underline;
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
            <a href="Profile.jsp">Profile</a>
        </nav>
        <div class="user-actions">
            <a href="upload-prescription.html" class="upload-btn">Upload Prescription</a>
            <a href="cart.jsp">Cart</a>
            <a href="LogoutServlet" class="auth-btn">Logout</a>
        </div>
    </header>

    <h2>Your Card Details</h2>
    <div class="card-grid">
        <%
            if (cards.isEmpty()) {
        %>
            <p style="text-align:center; color: #888;">No cards found. Please add a new card.</p>
        <%
            } else {
                for (Card card : cards) {
        %>
        <div class="card-item">
            <div class="card-details">
                <h3>Card ID: <%= card.getId() %></h3>
                <p><strong>Card Number:</strong> <%= card.getCardNumber() %></p>
                <p><strong>Card Holder Name:</strong> <%= card.getCardHolderName() %></p>
                <p><strong>Expiration Date:</strong> <%= card.getExpirationDate() %></p>
                <p><strong>CVV:</strong> <%= card.getCvv() %></p>
            </div>
            <div class="actions">
                <a href="card?action=edit&id=<%= card.getId() %>" class="edit-button">Edit</a>
                <a href="card?action=delete&id=<%= card.getId() %>" class="delete-button">Delete</a>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
    <a href="cardInput.jsp" class="add-card-link">Add New Card</a>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>
    <script src="script.js"></script>
</body>
</html>
