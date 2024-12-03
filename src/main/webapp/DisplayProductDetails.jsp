<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Product List</title>
    <link rel="stylesheet" href="admin-styles.css">
    <style>
        table { 
            width: 100%; 
            border-collapse: collapse; 
        } 
        tr, td, th { 
            border: 1px solid #000; 
            padding: 8px; 
            text-align: left; 
        } 
        th { 
            background-color: #f2f2f2;
        } 
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .btn-update, .btn-delete {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            color: white;
            cursor: pointer;
            text-align: center;
        }
        .btn-update {
            background-color: #4CAF50; /* Green */
        }
        .btn-delete {
            background-color: #f44336; /* Red */
        }
        .btn-update:hover {
            background-color: #45a049;
        }
        .btn-delete:hover {
            background-color: #d32f2f;
        }
    </style>
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
    <h2>Product List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Image</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Actions</th>
        </tr>
        <%
            List<ProductModel> productList = (List<ProductModel>) request.getAttribute("allProducts");
            if (productList != null && !productList.isEmpty()) {
                for (ProductModel product : productList) {
        %>
        <tr>
            <td><%= product.getProduct_Id() %></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getDescription() %></td>
            <td><img src="<%= request.getContextPath() + "/uploads/" + product.getImageURL() %>" alt="Product Image" width="100" height="100"/></td>
            <td><%= product.getQuantity() %></td>
            <td><%= product.getUnitPrice() %></td>
            <td class="action-buttons">
                          <form action="updateProduct.jsp" method="get">
							    <input type="hidden" name="id" value="<%= product.getProduct_Id() %>">
							    <input type="hidden" name="ProductName" value="<%= product.getProductName() %>">
							    <input type="hidden" name="ProductDes" value="<%= product.getDescription() %>">
							    <input type="hidden" name="ProQun" value="<%= product.getQuantity() %>">
							    <input type="hidden" name="ProPri" value="<%= product.getUnitPrice() %>">
							    <button type="submit" class="btn-update">Update</button>
							</form>
						       <button class="btn-delete" onclick="if(confirm('Are you sure you want to delete this product?')) location.href='DeleteProductServlet?id=<%= product.getProduct_Id() %>';">Delete</button>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7">No products available.</td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="admin-actions">
        <a href="InsertProducts.jsp">Add New Product</a>
    </div>

    <br><br>
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
