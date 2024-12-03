<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="MedicineOrderingSystem.AdminDAO" %>
<%@ page import="MedicineOrderingSystem.Admin" %>
<%

if (session == null || session.getAttribute("adminUsername") == null) {
    response.sendRedirect("adminLogin.jsp?error=You must log in first.");
    return;
}

String adminUsername = (String) session.getAttribute("adminUsername");

AdminDAO adminDAO = new AdminDAO();
Admin admin = adminDAO.getAdminByUsername(adminUsername);
%>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        .admin-actions {
            display: flex;
            justify-content: center; 
            gap: 10px;
            flex-wrap: wrap;
        }

        .admin-actions a {
            display: inline-block;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px; 
        }

        .home-button {
            display: inline-block;
            padding: 10px 15px;
            background-color: #008CBA; 
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px; 
        }
    </style>
    <link rel="stylesheet" href="admin-styles.css">

</head>
<body>
<header class="admin-header">
    <div class="admin-logo">
        <img src="images/logo.png" alt="Ceylon Care Logo">
        <h1>Ceylon Care Admin</h1>
    </div>
    <nav class="admin-nav">
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="ProductGetAllServlet">Manage Products</a>
            <a href="admin_userUserController?action=list">Manage Users</a>
            <a href="PharmacistGetAllServlet">Manage Pharmacist Accounts</a>
    </nav>
    <button class="admin-profile" onclick="location.href='adminDashboard.jsp'">Admin Profile</button>

</header>

<main class="admin-content">
    <h1>Welcome, <%= admin.getUsername() %>!</h1>

    <h2>Admin Profile</h2>
    <p><strong>Username:</strong> <%= admin.getUsername() %></p>
    <p><strong>Email:</strong> <%= admin.getEmail() %></p>

    <div class="admin-actions">
        <a href="InsertPharmacist.jsp">Add New Pharmacist</a>
        <a href="InsertProducts.jsp">Add New Product</a>
        <a href="admin_userUserAdd.jsp">Add New User</a>
        <a href="customerMessage.jsp">View Messages of customers</a>
    </div>

    
    <div style="text-align: center; margin-top: 20px;">
        <a href="home.jsp" class="home-button">Go to Home page of customers' view</a>
    </div>

    <br><br>

    <a href="AdminLogoutServlet" style="display: inline-block; padding: 10px 15px; background-color: #f44336; color: white; text-decoration: none; border-radius: 5px;">Logout</a>
</main>

<%
    String message = request.getParameter("message");
    if (message != null) {
        out.println("<p style='color:green;'>" + message + "</p>");
    }
%>

<footer class="admin-footer">
    <p>200/9, Devananda Road, Piliyandala</p>
    <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
</footer>

<script src="admin-script.js"></script>

</body>
</html>
