package MedicineOrderingSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminResetPasswordServlet")
public class AdminResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");

        AdminDAO adminDAO = new AdminDAO();

        
        Admin admin = adminDAO.getAdminByToken(token);
        if (admin != null) {
            
            adminDAO.updatePasswordByToken(token, newPassword);

            response.sendRedirect("adminLogin.jsp?message=Password has been reset.");
        } else {
            response.sendRedirect("adminResetPassword.jsp?error=Invalid or expired token.");
        }
    }
}
