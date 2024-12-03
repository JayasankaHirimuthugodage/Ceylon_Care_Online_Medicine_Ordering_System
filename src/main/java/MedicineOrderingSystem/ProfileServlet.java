package MedicineOrderingSystem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form input parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String daddress = request.getParameter("daddress");

        // Validate input
        if (firstName == null || lastName == null || phoneNumber == null || email == null || daddress == null ||
            firstName.isEmpty() || lastName.isEmpty() || phoneNumber.isEmpty() || email.isEmpty() || daddress.isEmpty()) {
            response.getWriter().println("All fields are required!");
            return;
        }

        // Retrieve the current user from the session
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");

        // Update the user's information
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setDaddress(daddress);
        //user.setDaddress();

        // Save the updated profile in the database
        boolean isUpdated = UserController.updateUserProfile(user);

        if (isUpdated) {
            // Update the session with the new user data
            session.setAttribute("user", user);
            response.sendRedirect("Profile.jsp");
        } else {
            response.getWriter().println("Failed to update profile. Please try again.");
        }
    }
}
