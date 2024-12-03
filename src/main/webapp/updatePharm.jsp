<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date, java.text.SimpleDateFormat, java.text.ParseException" %> 

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
    <title>Update Pharmacist Details</title>
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
	<%
	String pharmacist_Id = request.getParameter("pharmacist_Id");
	String name = request.getParameter("name");
	String email_address = request.getParameter("email_address");
	String contact_no = request.getParameter("contact_no");
	String license_no = request.getParameter("license_no");
	String specialization = request.getParameter("specialization");
	String dobStr = request.getParameter("dob");
	String hire_dateStr = request.getParameter("hire_date");
	String shift_timing = request.getParameter("shift_timing");
	String password = request.getParameter("password");

	// Converting the String into Date format
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	Date dob = null;
	Date hire_date = null;

	try {
		if(dobStr != null && hire_dateStr != null){
			dob = new Date(sdf.parse(dobStr).getTime());  
	    	hire_date = new Date(sdf.parse(hire_dateStr).getTime());
		}
    	
	} catch (ParseException e) {
   	 	e.printStackTrace();  
	}

	%>	

	<form action="UpdatePharmServlet" method="post">
    	<table>
    	<tr>
    		<td><label for="pharmacist_Id">Pharmacist_Id:</label></td>
    		<td><input type="text" id="pharmacist_Id" name="pharmacist_Id" value="<%=pharmacist_Id%>"readonly></td>
    	</tr>
    	
        <tr>
            <td><label for="name">Name:</label></td>
            <td><input type="text" id="name" name="name" value="<%=name%>"required></td>
        </tr>
        <tr>
            <td><label for="email_address">Email Address:</label></td>
            <td><input type="email" id="email_address" name="email_address" value="<%=email_address%>" required></td>
        </tr>
        <tr>
            <td><label for="contact_no">Contact Number:</label></td>
            <td><input type="text" id="contact_no" name="contact_no" value="<%=contact_no%>" required></td>
        </tr>
        <tr>
            <td><label for="license_no">License Number:</label></td>
            <td><input type="text" id="license_no" name="license_no" value="<%=license_no%>" required></td>
        </tr>
        <tr>
    		<td><label for="specialization">Specialization:</label></td>
    		<td>
        		<select id="specialization" name="specialization" required>
            		<option value="Community Pharmacist" <%= "Community Pharmacist".equals(specialization) ? "selected" : "" %>>Community Pharmacist</option>
            		<option value="Consultant Pharmacist" <%= "Consultant Pharmacist".equals(specialization) ? "selected" : "" %>>Consultant Pharmacist</option>
            		<option value="Technical Pharmacist" <%= "Technical Pharmacist".equals(specialization) ? "selected" : "" %>>Technical Pharmacist</option>
            		<option value="Sales Representative Pharmacist" <%= "Sales Representative Pharmacist".equals(specialization) ? "selected" : "" %>>Sales Representative Pharmacist</option>
        		</select>
   		  </td>
		</tr>

        <tr>
            <td><label for="dob">Date of Birth:</label></td>
            <td><input type="date" id="dob" name="dob" value="<%=dob%>"  required></td>
        </tr>
        <tr>
            <td><label for="hire_date">Hire Date:</label></td>
            <td><input type="date" id="hire_date" name="hire_date" value="<%=hire_date%>" required></td>
        </tr>
        <tr>
    		<td><label for="shift_timing">Shift Timing:</label></td>
    		<td>
        		<select id="shift_timing" name="shift_timing" required>
            		<option value="Day" <%= "Day".equals(shift_timing) ? "selected" : "" %>>Day</option>
            		<option value="Night" <%= "Night".equals(shift_timing) ? "selected" : "" %>>Night</option>
            		<option value="Rotating" <%= "Rotating".equals(shift_timing) ? "selected" : "" %>>Rotating</option>
       			</select>
    		</td>
		</tr>

        <tr>
            <td><label for="password">Password:</label></td>
            <td><input type="password" id="password" name="password" <%=password%>" required></td>
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
