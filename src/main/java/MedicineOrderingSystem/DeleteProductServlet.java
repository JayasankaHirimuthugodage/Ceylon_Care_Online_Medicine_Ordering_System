package MedicineOrderingSystem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product ID from the request
        int productId = Integer.parseInt(request.getParameter("id"));

        // Call the ProductCtrl to delete the product
        boolean isDeleted = ProductCtrl.deleteProduct(productId);

        // Redirect back to the product list with a success/failure message
        if (isDeleted) {
            response.sendRedirect("ProductGetAllServlet?message=Product+deleted+successfully");
        } else {
            response.sendRedirect("ProductGetAllServlet?message=Failed+to+delete+product");
        }
    }
}
