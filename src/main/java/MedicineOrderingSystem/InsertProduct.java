//InsertProduct.java
package MedicineOrderingSystem;


import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/InsertProduct")
public class InsertProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Define the directory to save the uploaded image
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String productName = request.getParameter("product_name");
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double unitPrice = Double.parseDouble(request.getParameter("unit_price"));

        // Handle image file upload
        Part filePart = request.getPart("image"); // Retrieves the <input type="file" name="image">
        String fileName =  this.generateRandomString(23);// Get the image file name
        //String imagePath = UPLOAD_DIRECTORY + File.separator + fileName;

        // Absolute path to save the file
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Create directory if not exists
        }

        // Save the uploaded file to the specified directory
        filePart.write(uploadPath + File.separator + fileName);

        // Now, call the ProductCtrl to insert the product into the database
        boolean isSuccess = ProductCtrl.insertProduct(productName, description, fileName, quantity, unitPrice);

        if (isSuccess) {
        	String alertMessage = "Data Insert Successful";
            response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='ProductGetAllServlet'</script>");
        } else {
            // Show error message
            response.getWriter().println("Failed to insert the product.");
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
