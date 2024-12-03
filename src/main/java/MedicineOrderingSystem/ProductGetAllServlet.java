//ProductGetAllServlet.java
package MedicineOrderingSystem;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ProductGetAllServlet")
public class ProductGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProductModel> allProducts = ProductCtrl.getAllProducts();

		// Check if the product list is being fetched correctly
		for(ProductModel product : allProducts) {
		    System.out.println("Product ID: " + product.getProduct_Id());
		    System.out.println("Product Name: " + product.getProductName());
		}

		

		
		request.setAttribute("allProducts",allProducts);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayProductDetails.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	

}
