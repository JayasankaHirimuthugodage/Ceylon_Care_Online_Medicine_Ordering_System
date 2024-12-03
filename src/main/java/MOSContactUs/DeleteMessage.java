package MOSContactUs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import MedicineOrderingSystem.UserModel;


@WebServlet("/DeleteMessage")
public class DeleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");
        
        if (user != null) {	
			
			String id = request.getParameter("id");
			
			boolean isDeleted = false;
			
			isDeleted = ContactUsDBUtil.deleteMessage(id);
			
			
			if(isDeleted == true) {
				
				response.sendRedirect("MessageRead");
				
			} else {
				
				response.sendRedirect("MessageRead");
				
			}
			
        } else {
			
			// If no email in session
			response.sendRedirect("contactUs.jsp");
			
		}
				
	}

}
