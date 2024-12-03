package MedicineOrderingSystem;

import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

 
 
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests to fetch the product details
    private static final String UPLOAD_DIRECTORY = "uploads";

    

    // Handle POST requests to update the product details
 // Handle POST requests to update the product details
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdParam = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String quantityParam = request.getParameter("quantity");
        String unitPriceParam = request.getParameter("unitPrice");

        // Proper null checks for parameters
        if (productIdParam == null || productIdParam.isEmpty() || 
            quantityParam == null || quantityParam.isEmpty() || 
            unitPriceParam == null || unitPriceParam.isEmpty()) {
            System.out.println("Required fields are missing");
            request.setAttribute("message", "All fields must be filled out.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateProduct.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Parse values after null check
        int productId = Integer.parseInt(productIdParam);
        int productQun = Integer.parseInt(quantityParam);
        double productPri = Double.parseDouble(unitPriceParam);

        // Handle image file upload
        Part filePart = request.getPart("image");
        String fileName = this.generateRandomString(23);
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        filePart.write(uploadPath + File.separator + fileName);

        // Update product in the database
        boolean isTrue = ProductCtrl.updateProduct(productId, productName, description, fileName, productQun, productPri);

        if (isTrue) {
            response.sendRedirect("MessageRead");
        } else {
            response.sendRedirect("MessageRead");
        }
    }


    public  String generateRandomString(int length) {
        final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomString = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = (int) (Math.random() * CHARACTERS.length());
            randomString.append(CHARACTERS.charAt(index));
        }
        return randomString.toString();
    }
        
    }

