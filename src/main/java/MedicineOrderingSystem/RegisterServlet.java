package MedicineOrderingSystem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form input parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String daddress = request.getParameter("daddress");

        // Validation (optional but recommended)
        if (firstName == null || lastName == null || phoneNumber == null || email == null || password == null || daddress == null ||
            firstName.isEmpty() || lastName.isEmpty() || phoneNumber.isEmpty() || email.isEmpty() || password.isEmpty() || daddress.isEmpty()) {
            response.getWriter().println("All fields are required!");
            return; // Stop execution if any field is invalid
        }

        // Create a UserModel object with the input data
        UserModel user = new UserModel(firstName, lastName, phoneNumber, email, password, daddress);

        // Register the user using UserController
        boolean isRegistered = UserController.registerUser(user);

        // Check if registration is successful
        if (isRegistered) {
            // Redirect to the profile page after successful registration
            response.sendRedirect("Profile.jsp");
        } else {
            // Display an error message if registration fails
            response.getWriter().println("Registration failed. Please try again.");
        }
    }
}
