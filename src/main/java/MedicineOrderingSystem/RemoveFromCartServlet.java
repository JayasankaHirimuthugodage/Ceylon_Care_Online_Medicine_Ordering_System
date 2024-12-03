package MedicineOrderingSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Retrieve the current session
        HttpSession session = request.getSession();
        ArrayList<ProductModel> cart = (ArrayList<ProductModel>) session.getAttribute("cart");

        if (cart != null) {
            // Remove product from session cart
            cart.removeIf(product -> product.getProduct_Id() == productId);
            session.setAttribute("cart", cart);
        }

        // Retrieve the user details from the session
        UserModel user = (UserModel) session.getAttribute("user");

        if (user != null) {
            String userEmail = user.getEmail();
            
            // Remove product from the database cart table
            try (Connection connection = DBConnection.getConnection()) {
                String sql = "DELETE FROM cart WHERE user_email = ? AND product_Id = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, userEmail);
                    statement.setInt(2, productId);
                    statement.executeUpdate();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
