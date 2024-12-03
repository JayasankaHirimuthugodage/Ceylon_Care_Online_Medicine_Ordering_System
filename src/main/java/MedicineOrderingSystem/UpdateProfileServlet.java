package MedicineOrderingSystem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the update form
        //int userId = Integer.parseInt(request.getParameter("userId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String daddress = request.getParameter("daddress");

        // Create a UserModel object with the updated details
        UserModel user = new UserModel( firstName, lastName, phoneNumber, email, password,daddress);

        // Use the UserController to update the user profile
        boolean isUpdated = UserController.updateUserProfile(user); // This is now corrected to match UserController

        // If update is successful, redirect to profile page
        if (isUpdated) {
            response.sendRedirect("profile.jsp");
        } else {
            response.getWriter().println("Update failed. Try again.");
        }
    }
}
