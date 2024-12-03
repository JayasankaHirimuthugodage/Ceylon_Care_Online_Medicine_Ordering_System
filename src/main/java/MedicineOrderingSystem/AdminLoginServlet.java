package MedicineOrderingSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        AdminDAO adminDAO = new AdminDAO();

        
        Admin admin = adminDAO.getAdminByUsernameAndPassword(username, password);

        if (admin != null) {
            
            HttpSession session = request.getSession();
            session.setAttribute("adminUsername", admin.getUsername());

           
            response.sendRedirect("adminDashboard.jsp");
        } else {
            
            response.sendRedirect("adminLogin.jsp?error=Invalid username or password");
        }
    }
}
