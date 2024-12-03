<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="MedicineOrderingSystem.ProductModel" %>
<%
    ProductModel product = (ProductModel) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link rel="stylesheet" href="admin-styles.css">
</head>
<body>
<main class="admin-content">
    <h2>Update Product</h2>
    
    <%
            String id = request.getParameter("id");
            String ProductName = request.getParameter("ProductName");
            String ProductDes = request.getParameter("ProductDes");
            String ProQun = request.getParameter("ProQun");
            String ProPri = request.getParameter("ProPri");

        %>

    <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
         <input type="text" name="productId" value="<%= id %>" />
        

        <label>Product Name:</label>
        <input type="text" name="productName" value="<%= ProductName %>" required/>

        <label>Description:</label>
        <textarea name="description" required><%= ProductDes %></textarea>

        <label>Quantity:</label>
        <input type="number" name="quantity" value="<%= ProQun %>" required/>

        <label>Unit Price:</label>
        <input type="text" name="unitPrice" value="<%= ProPri %>" required/>

        <label>Image (upload new if needed):</label>
         <td><input type="file" id="image" name="image" accept="image/*" required></td>

        <button type="submit">Update Product</button>
    </form>
</main>
</body>
</html>
