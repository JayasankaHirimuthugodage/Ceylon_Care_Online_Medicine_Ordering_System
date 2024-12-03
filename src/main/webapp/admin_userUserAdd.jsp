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
    <title>Add User</title>
    
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
    
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div style="color: red;">
        <%= request.getAttribute("errorMessage") %>
    </div>
	<% } %>
    
    
<h2>Add User</h2>
<form action="admin_userUserController?action=add" method="post" style="width: 60%;">
    <label>First Name:</label>
    <input type="text" name="firstName" pattern="[A-Za-z]{2,30}" title="First name must be 2 to 30 letters long." required>
    <br>
    
    <label>Last Name:</label>
    <input type="text" name="lastName" pattern="[A-Za-z]{2,30}" title="Last name must be 2 to 30 letters long." required>
    <br>
    
    <label>Phone Number:</label>
    <input type="text" name="phoneNumber" pattern="\d{10}" title="Phone number must be exactly 10 digits." required>
    <br>
    
    <label>Email:</label>
    <input type="email" name="email" title="Please enter a valid email address." required>
    <br>
    
    <label>Password:</label>
    <input type="password" name="password" minlength="6" title="Password must be at least 6 characters long." required>
    <br>
    
    <label>Address:</label>
    <input type="text" name="daddress" required>
    <br>
    
    <input type="submit" value="Add User" style="margin-left:38%;">
</form>

<a href="admin_userUserController?action=list">Cancel</a>

</main>
<footer class="admin-footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <script src="admin-script.js"></script>
</body>
</html>