<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="MedicineOrderingSystem.AdminDAO" %>
<%@ page import="MedicineOrderingSystem.Admin" %>
<%  
    if (session == null || session.getAttribute("adminUsername") == null) {
        response.sendRedirect("adminLogin.jsp?error=You must log in first.");
        return;
    }

    String adminUsername = (String) session.getAttribute("adminUsername");

    // Retrieve the details of admin
    AdminDAO adminDAO = new AdminDAO();
    Admin admin = adminDAO.getAdminByUsername(adminUsername);
%>

<html>
<head>
    <title>User List</title>
    
    <style>
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 16px;
            text-align: left;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }

        .action-cell {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            align-items: center; 
            min-width: 170px; 
        }

        .update-btn, .delete-btn {
            padding: 8px 12px; 
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            font-size: 14px; 
            border: none; 
            color: white;
            text-decoration: none; 
        }

        .update-btn {
            background-color: #4CAF50;
            transition: background-color 0.3s ease; 
        }

        .update-btn:hover {
            background-color: #45a049; 
        }

        .delete-btn {
            background-color: #f44336;
            transition: background-color 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #e53935;
        }

        .password-cell {
            position: relative;
        }

        .toggle-password-btn {
            cursor: pointer;
            border: none;
            background: none;
            color: blue;
            text-decoration: underline;
            font-size: 14px;
            margin-left: 5px;
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
        <a href="#">Manage Products</a>
        <a href="admin_userUserController?action=list">Manage Users</a>
        <a href="PharmacistGetAllServlet">Manage Pharmacist Accounts</a>
    </nav>
    <button class="admin-profile" onclick="location.href='adminDashboard.jsp'">Admin Profile</button>
</header>

<main class="admin-content">

<h2>User List</h2>

<input type="email" id="searchEmail" placeholder="Search user email" style="width:50%">

<table border="1">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Password</th>
        <th class="action-column">Actions</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.phoneNumber}</td>
            <td>${user.email}</td>
            <td>${user.daddress}</td>
            <td class="password-cell">
                <input type="password" value="${user.password}" class="password" readonly style="width: 100px;" />
                <button type="button" class="toggle-password-btn" onclick="togglePassword(this)">Show</button>
            </td>
            <td class="action-cell">
                <a href="admin_userUserController?action=edit&email=${user.email}" class="update-btn">Update</a>
                <a href="admin_userUserController?action=delete&email=${user.email}" class="delete-btn">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="admin_userUserAdd.jsp">Add User</a>

</main>

<footer class="admin-footer">
    <p>200/9, Devananda Road, Piliyandala</p>
    <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
</footer>

<script>
    function togglePassword(button) {
    	// Retrives the password input field
        var passwordField = button.previousElementSibling; 
        if (passwordField.type === "password") {
            passwordField.type = "text"; 
            button.textContent = "Hide"; 
        } else {
            passwordField.type = "password"; 
            button.textContent = "Show"; 
        }
    }
    
	//function for filtering the table rows according to the email entered in the search area.
    function filterTable() {
        var input, filter, table, tr, td, i, j, txtValue;
        
        input = document.getElementById("searchEmail");
        filter = input.value.toUpperCase();
        table = document.querySelector("table");
        tr = table.getElementsByTagName("tr");
        
        //loop for the rows of table from the second row as the starting point(header is the first row)
        for (i = 1; i < tr.length; i++) {
            tr[i].style.display = "none"; 
            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < td.length; j++) {
            	
            	//if the text matches the search term, show the row
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = ""; //this shows the row.
                        break;
                    }
                }
            }
        }
    }
    
    document.getElementById("searchEmail").addEventListener("input", filterTable);
</script>

</body>
</html>
