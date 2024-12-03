package MOSContactUs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import MedicineOrderingSystem.UserModel;

@WebServlet("/UpdateMessage")
public class UpdateMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");
        
        if (user != null) {
		
			String id = request.getParameter("id");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String opEmail = request.getParameter("opEmail");
			String description = request.getParameter("description");
			
			boolean isTrue;
			
			isTrue = ContactUsDBUtil.updateMessage(id ,firstName, lastName, opEmail, description);
			
			if(isTrue == true) {
				
				response.sendRedirect("MessageRead");
				
			}else {
				
				//unsuccessful update
				response.sendRedirect("MessageRead");
				
			}
			
        } else {
			
			// If no email in session, redirect to contactUs page or show an error
			response.sendRedirect("contactUs.jsp");
			
		}	
		
	}

}
