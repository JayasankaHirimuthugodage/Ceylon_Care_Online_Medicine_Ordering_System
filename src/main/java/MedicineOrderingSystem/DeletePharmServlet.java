package MedicineOrderingSystem;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeletePharmServlet")
public class DeletePharmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pharmacist_Id = request.getParameter("pharmacist_Id");
		boolean isTrue;
		
		isTrue = PharmasistCtrl.deletedata(pharmacist_Id);
		if(isTrue == true) {
			String alertMessage = "Data Delete Successful";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='PharmacistGetAllServlet';</script>");
		}
		else {
			List<Pharmasist_model> pharmacistdetails =PharmasistCtrl.getById(pharmacist_Id);
			request.setAttribute("pharmacistdetails", pharmacistdetails);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
			
			dispacher.forward(request, response);
		}
	}

}
