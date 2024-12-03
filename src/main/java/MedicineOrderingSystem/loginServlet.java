package MedicineOrderingSystem;

 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form input parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.getWriter().println("Email and Password are required!");
            return;
        }

        // Check if user exists with the given email and password
        UserModel user = UserController.getUserByEmail(email);
        
       // System.out.println(user.getPassword());
        
        // Here, you'd normally want to hash and check the password securely
        if (user != null && user.getPassword().equals(password)) {
            // Create a session for the user
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // Redirect to the profile page or wherever you want
            response.sendRedirect("home.jsp");
        } else {
            response.getWriter().println("Invalid email or password!");
        }
    }
}

