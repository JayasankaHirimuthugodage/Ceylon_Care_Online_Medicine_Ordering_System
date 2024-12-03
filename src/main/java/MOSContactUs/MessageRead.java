package MOSContactUs;

import MedicineOrderingSystem.UserModel;
import java.io.IOException;
import java.util.List;  
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MessageRead")
public class MessageRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");
        
        if (user != null) {
        	
        	String email = user.getEmail(); 
			
	        // Retrieve messages associated with the email
	        List<Message> mesDetails = ContactUsDBUtil.getMessages(email);
	        
	        // Set the messages as a request attribute
	        request.setAttribute("mesDetails", mesDetails);
	        
	        // Forward the request to the JSP page
	        RequestDispatcher dis = request.getRequestDispatcher("message.jsp");
	        dis.forward(request, response);
        
		} else {
			
			// If no email in session, redirect to contactUs page or show an error
			response.sendRedirect("contactUs.jsp");
			
		}
	}

}
