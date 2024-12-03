package MedicineOrderingSystem;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdatePharmServlet")
public class UpdatePharmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String pharmacist_Id=request.getParameter("pharmacist_Id");
		    String name = request.getParameter("name");
	        String email_address = request.getParameter("email_address");
	        String contact_no = request.getParameter("contact_no");
	        String license_no = request.getParameter("license_no");
	        String specialization = request.getParameter("specialization");
	        String dobStr = request.getParameter("dob");
	        String hire_dateStr = request.getParameter("hire_date");
	        String shift_timing = request.getParameter("shift_timing");
	        String password = request.getParameter("password");
	        
	        // Convert String to Date
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date dob = null;
	        Date hire_date = null;
	        try {
	            dob = new Date(sdf.parse(dobStr).getTime());
	            hire_date = new Date(sdf.parse(hire_dateStr).getTime()); 
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }

	        
	        boolean isTrue;
	        
	        isTrue = PharmasistCtrl.updatedata(pharmacist_Id, name, email_address, contact_no, license_no, specialization, dob, hire_date, shift_timing, password);
	        
	        if (isTrue == true) {
	        	List<Pharmasist_model> pharmacistdetails = PharmasistCtrl.getById(pharmacist_Id);
	        	request.setAttribute("pharmacistdetails",pharmacistdetails);
	        	
	            String alertMessage = "Data Update Successful";
	            response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='PharmacistGetAllServlet'</script>");
	         } else {
	         	RequestDispatcher dis2 = request.getRequestDispatcher("pharmwrong.jsp");
	         	dis2.forward(request, response);
	             
	         }
	}

}
