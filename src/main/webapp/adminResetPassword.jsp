<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="MedicineOrderingSystem.AdminDAO" %>
<%@ page import="MedicineOrderingSystem.Admin" %>

<html>
<head>
    <title>Reset Password</title>
    
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-styles.css">
</head>
<body>

	<header class="admin-header">
        <div class="admin-logo">
            <img src="images/logo.png" alt="Ceylon Care Logo">
            <h1>Ceylon Care Admin</h1>
        </div>
        <nav class="admin-nav">
            <a href="#">Dashboard</a>
            <a href="#">Manage Products</a>
            <a href="#">Manage Users</a>
            <a href="PharmacistGetAllServlet">Manage Pharmacist Accounts</a>
        </nav>
        <button class="admin-profile" onclick="location.href='adminDashboard.jsp'">Admin Profile</button>

    </header>
    
    <main class="admin-content">
    <h1>Reset Your Password</h1>

    <%
        String token = request.getParameter("token");
        if (token == null || token.isEmpty()) {
            out.println("<p style='color:red;'>Invalid or missing token.</p>");
        } else {
    %>

    <form action="AdminResetPasswordServlet" method="post">
        <input type="hidden" name="token" value="<%= token %>" />
        <label for="newPassword">Enter New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required />
        <br><br>
        <button type="submit" style="width:100px; margin-left: 250px;">Reset Password</button>
    </form>

    <%
        }
    %>
    </main>
    
     <footer class="admin-footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <script src="admin-script.js"></script>

</body>
</html>
