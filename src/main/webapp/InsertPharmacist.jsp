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
<!DOCTYPE html>
<html>
<head>
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
    	
        <h2>Welcome to Ceylon Care Admin Dashboard</h2>

<h2>Enter Pharmacist Details</h2>
<form action="InsertPharmacist" method="post">
    <table>
        <tr>
            <td><label for="name">Name:</label></td>
            <td><input type="text" id="name" name="name" required pattern="^[A-Za-z\s]{1,100}$" title="Name should contain only letters and spaces, and be up to 100 characters long"></td>
        </tr>
        
        <tr>
            <td><label for="email_address">Email Address:</label></td>
            <td><input type="email" id="email_address" name="email_address" required></td>
        </tr>
        
        
        <tr>
            <td><label for="contact_no">Contact Number:</label></td>
            <td><input type="tel" id="contact_no" name="contact_no" required pattern="[0-9]{10}" title="Please enter a 10-digit phone number"></td>
        </tr>
        
        
        
        <tr>
            <td><label for="license_no">License Number:</label></td>
            <td><input type="text" id="license_no" name="license_no" required pattern="[AP][0-9]{5}" title="License number should start with 'A' for apprentices or 'P' for permanent pharmacists, followed by 5 digits"></td>
      
            
        </tr>
        
        <tr>
    		<td><label for="specialization">Specialization:</label></td>
    		<td>
        	<select id="specialization" name="specialization">
            	<option value="Community Pharmacist">Community Pharmacist</option>
            	<option value="Consultant Pharmacist">Consultant Pharmacist</option>
            	<option value="Technical Pharmacist">Technical Pharmacist</option>
           		<option value="Sales Representative Pharmacist">Sales Representative Pharmacist</option>
        	</select>
    	   </td>
	   </tr>

        <tr>
            <td><label for="dob">Date of Birth:</label></td>
            <td><input type="date" id="dob" name="dob" required></td>
        </tr>
        <tr>
            <td><label for="hire_date">Hire Date:</label></td>
            <td> <input type="date" id="hire_date" name="hire_date" required max="<%= java.time.LocalDate.now() %>"title="Hire date cannot be in the future"></td>
        </tr>
        
        <tr>
            <td><label for="shift_timing">Shift Timing:</label></td>
            <td><select id="shift_timing" name="shift_timing" required>
                            <option value="">Select a shift</option>
                            <option value="day">Day</option>
                            <option value="night">Night</option>
                            <option value="rotating">Rotating</option>
                </select>
            </td>
        </tr>
        
        <tr>
            <td><label for="password">Password:</label></td>
            <td><input type="password" id="password" name="password" required minlength="8"  title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character (!@#$%^&*)"></td>
            
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