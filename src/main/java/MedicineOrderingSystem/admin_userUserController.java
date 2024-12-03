package MedicineOrderingSystem;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin_userUserController")
public class admin_userUserController extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    private admin_userUserService userService = new admin_userUserServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String action = request.getParameter("action");
        
        if ("list".equals(action)) {
        	
            List<UserModel> users = userService.getAllUsers();
            request.setAttribute("users", users);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_userUserList.jsp");
            dispatcher.forward(request, response);
            
        } else if ("delete".equals(action)) {
            String email = request.getParameter("email");
            userService.deleteUser(email);
            
         // Display an alert indicating successful deletion and then redirect to the user list.
            String alertMessage = "Data Delete Successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='admin_userUserController?action=list'; </script>");
            
        } else if ("edit".equals(action)) {
            String email = request.getParameter("email");
            UserModel user = userService.getUserByEmail(email);
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_userUserEdit.jsp");
            dispatcher.forward(request, response);
        }
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Collect user input from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String daddress = request.getParameter("daddress");
        

       
        String originalEmail = request.getParameter("originalEmail"); // Retrieve the email that was originally used(email which is given in account creation), stored in a hidden field
        
        
        UserModel user = new UserModel(firstName, lastName, phoneNumber, email, password, daddress);// Creating a object for UserModel
        user.setOriginalEmail(originalEmail); // Set the email which was originally used in UserModel

        if ("add".equals(action)) {
        	
            // Condition for checking whether the email already exists for the new user
            if (userService.getUserByEmail(email) != null) {
                request.setAttribute("errorMessage", "This email address is already taken!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin_userUserAdd.jsp");
                dispatcher.forward(request, response);
                return;
            }
            
            // Inserting new user
            boolean insertResult = userService.insertUser(user);
            if (insertResult) {
                String alertMessage = "Data Insert for new customer account is Successful";
                response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='admin_userUserController?action=list'</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("pharmwrong.jsp");
                dis2.forward(request, response);
            }

            
           
            
        } else if ("update".equals(action)) {
            
            if (!email.equals(originalEmail) && userService.getUserByEmail(email) != null) {
            	
            	//If the new email is different and already exists, this shows an error message.
                request.setAttribute("errorMessage", "This email address is already taken!");
                
                request.setAttribute("user", user); // Sending user's data back to the update page(This prevents the losing of their already entered input)
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin_userUserEdit.jsp");
                
                dispatcher.forward(request, response);// Redirecting to the update page with the error message
                return;
            }
            //If above condition does not satisfy, update the user's info
            
            boolean updateResult = userService.updateUser(user);
            if (updateResult) {
                String alertMessage = "Data Update for selected customer account is Successful";
                response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='admin_userUserController?action=list'</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("pharmwrong.jsp");
                dis2.forward(request, response);
            }
            
            
        }
        
        

        
    }
    
    

}