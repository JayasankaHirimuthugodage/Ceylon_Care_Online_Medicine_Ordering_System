package MOSContactUs;

import MedicineOrderingSystem.UserModel;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MessageInsert")
public class MessageInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get the form parameters
    	String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String description = request.getParameter("description");
        String opEmail = request.getParameter("opEmail");
        
        // check input values 
        if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() || description == null || description.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            RequestDispatcher dis = request.getRequestDispatcher("contactUs.jsp");
            dis.forward(request, response);
            return;  
        }


        boolean isTrue;

        Timestamp dateTime = null;

        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");  

        // Check if user is logged in and set the email
        if (user != null) {
        	
            String email = user.getEmail(); 

            // Create the message object using the retrieved email
            Message message = new Message(0, firstName, lastName, email, description, dateTime, opEmail);
            isTrue = ContactUsDBUtil.insertMessage(message);

            if (isTrue) {
            	
                // On success, redirect to the MessageRead page
                response.sendRedirect("MessageRead");
            } else {
            	
                // On failure, forward back to contactUs.jsp
                RequestDispatcher dis = request.getRequestDispatcher("contactUs.jsp");
                dis.forward(request, response);
            }
        } else {
            // Handle case where user is not logged in
            response.sendRedirect("login.jsp");
        }
    }
}
