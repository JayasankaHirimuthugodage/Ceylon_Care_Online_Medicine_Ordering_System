<!-- InsertProducts.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page import="java.util.List, MedicineOrderingSystem.ProductModel" %>
 <%@ page import="MedicineOrderingSystem.AdminDAO" %>
<%@ page import="MedicineOrderingSystem.Admin" %>
    <%@ page import="javax.servlet.http.HttpSession" %>
    


<%
    if (session == null || session.getAttribute("adminUsername") == null) {
        response.sendRedirect("adminLogin.jsp?error=You must log in first.");
        return;
    }
    String adminUsername = (String) session.getAttribute("adminUsername");
    AdminDAO adminDAO = new AdminDAO();
    Admin admin = adminDAO.getAdminByUsername(adminUsername);
%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Product Details</title>
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
    	
        <h2>Welcome to Ceylon Care Admin Dashboard</h2>

        <h2>Enter Product Details</h2>
        <form action="InsertProduct" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td><label for="product_name">Product Name:</label></td>
                    <td><input type="text" id="product_name" name="product_name" required pattern="^[A-Za-z0-9\s]{1,100}$" title="Product name can contain letters, numbers, and spaces, up to 100 characters long"></td>
                </tr>
                
                <tr>
                    <td><label for="description">Description:</label></td>
                    <td><textarea id="description" name="description" required></textarea></td>
                </tr>
                
                <tr>
                    <td><label for="image">Product Image:</label></td>
                    <td><input type="file" id="image" name="image" accept="image/*" required></td>
                </tr>
                
                <tr>
                    <td><label for="quantity">Quantity:</label></td>
                    <td><input type="number" id="quantity" name="quantity" required min="1" title="Please enter a valid quantity"></td>
                </tr>
                
                <tr>
                    <td><label for="unit_price">Unit Price:</label></td>
                    <td><input type="number" id="unit_price" name="unit_price" required step="0.01" min="0.01" title="Please enter a valid unit price (minimum 0.01)"></td>
                </tr>
                
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Submit">
                    </td>
                </tr>
            </table>
        </form>
	
    </main>

    <footer class="admin-footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <script src="admin-script.js"></script>

</body>
</html>
