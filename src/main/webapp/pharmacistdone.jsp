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
<title>done</title>
</head>
<body>
<h2>Data Insertion for pharmacist account is done.</h2>

</body>
</html>