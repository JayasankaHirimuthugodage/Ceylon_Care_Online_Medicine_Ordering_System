package MedicineOrderingSystem;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PharmacistGetAllServlet")
public class PharmacistGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <Pharmasist_model>allPharmacists = PharmasistCtrl.getAllPharmacists();
		request.setAttribute("allPharmacists",allPharmacists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayPharmacistsDetails.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	

}
