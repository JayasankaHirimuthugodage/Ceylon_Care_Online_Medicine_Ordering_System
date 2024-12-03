<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<!DOCTYPE html>
<html>
<head>
    <title>Pharmacist Data Display</title>
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

        .date-column {
            min-width: 120px;
        }

        .action-cell {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            align-items: center; 
            min-width:170px; 
        }

        .update-btn, .delete-btn {
            flex: 1;
            padding: 8px 12px; 
            width:80px;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            font-size: 14px; 
        }

        .update-btn {
            background-color: #4CAF50;
            color: white;
            transition: background-color 0.3s ease; 
        }

        .update-btn:hover {
            background-color: #45a049; 
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
            transition: background-color 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #e53935;
        }

       
        .password-column {
    		min-width: 170px; 
    		text-align:center;
		}

		.password-field {
    		width: 120px !important; 
    		
		}

		.toggle-password-btn {
    		width: 70px; 
    		margin-left:10px;
		}

    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Pharmacist Details</title>
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

    <h2>Pharmacist Data</h2>
    
    <input type="number" id="searchPharmId" placeholder="Search pharmacist id" style="width:50%">
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>License No</th>
            <th>Specialization</th>
            <th class="date-column">Date of Birth</th>
            <th class="date-column">Hire Date</th>
            <th>Shift Timing</th>
            <th>Password</th>
            <th class="action-column">Action</th>
        </tr>

        <!-- Loop for displaying the all data of pharmacists -->
        <c:forEach var="pharmacists" items="${allPharmacists}">
            <tr>
                <td>${pharmacists.pharmacist_Id}</td>
                <td>${pharmacists.name}</td>
                <td>${pharmacists.email_address}</td>
                <td>${pharmacists.contact_no}</td>
                <td>${pharmacists.license_no}</td>
                <td>${pharmacists.specialization}</td>
                <td class="date-column">${pharmacists.dob}</td>
                <td class="date-column">${pharmacists.hire_date}</td>
                <td>${pharmacists.shift_timing}</td>

                
                <td class="password-column">
                    <input type="password" value="${pharmacists.password}" class="password-field" readonly />
                    <button type="button" class="toggle-password-btn" onclick="togglePassword(this)">Show</button>
                </td>

               
                <td class="action-column">
                    <div class="action-cell">
                        
                        <a href="updatePharm.jsp?pharmacist_Id=${pharmacists.pharmacist_Id}&name=${pharmacists.name}&email_address=${pharmacists.email_address}&contact_no=${pharmacists.contact_no}&license_no=${pharmacists.license_no}&specialization=${pharmacists.specialization}&dob=${pharmacists.dob}&hire_date=${pharmacists.hire_date}&shift_timing=${pharmacists.shift_timing}&password=${pharmacists.password}">
                            <button class="update-btn">Update</button>
                        </a>

                        
                        <form action="DeletePharmServlet" method="post" style="display: inline;">
                            <input type="hidden" name="pharmacist_Id" value="${pharmacists.pharmacist_Id}" />
                            <button class="delete-btn">Delete</button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

</main>

<footer class="admin-footer">
    <p>200/9, Devananda Road, Piliyandala</p>
    <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
</footer>

<script src="admin-script.js"></script>


<script>
    function togglePassword(button) {
        var passwordField = button.previousElementSibling;
        if (passwordField.type === "password") {
            passwordField.type = "text";
            button.textContent = "Hide";
        } else {
            passwordField.type = "password";
            button.textContent = "Show";
        }
    }
    
  //function for filtering the table rows according to the number entered in the search area.
    
	function filterTable() {
   	 var input, filter, table, tr, td, i, txtValue;
    
    	input = document.getElementById("searchPharmId"); //get the search input field
    	filter = input.value.toUpperCase(); //convert input to uppercase for matching
    	table = document.querySelector("table"); //select the table element
    	tr = table.getElementsByTagName("tr"); //get all rows of the table
    
    	//loop through the rows of the table, skipping the first row (header row)
    	for (i = 1; i < tr.length; i++) {
        	//get the first column (ID column) of each row
        	td = tr[i].getElementsByTagName("td")[0];
        
        	if (td) {
            	txtValue = td.textContent || td.innerText; //get the text value from the ID column
            
            	//if the input matches the ID column value, show the row
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = ""; //this shows the row
            } else {
                tr[i].style.display = "none"; //this hides the row if no match is found
            }
            	
        }
    }
}

document.getElementById("searchPharmId").addEventListener("input", filterTable); //attach the filter function to the search input field

    
    document.getElementById("searchPharmId").addEventListener("input", filterTable);
</script>

</body>
</html>