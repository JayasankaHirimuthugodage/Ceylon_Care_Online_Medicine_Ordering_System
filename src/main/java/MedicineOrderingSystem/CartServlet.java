package MedicineOrderingSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductModel product = null;

        // Retrieve the session without creating a new one
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User is not logged in.");
            return;
        }

        // Retrieve user email from the session
        UserModel user = (UserModel) session.getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try (Connection connection = DBConnection.getConnection()) {
            // Query to get product details
            String sql = "SELECT product_Id, product_name, description, image_url, quantity, unit_price FROM products WHERE product_Id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, productId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    product = new ProductModel();
                    product.setProduct_Id(resultSet.getInt("product_Id"));
                    product.setProductName(resultSet.getString("product_name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setImageURL(resultSet.getString("image_url")); // Correctly set image URL
                    product.setQuantity(resultSet.getInt("quantity"));
                    product.setUnitPrice(resultSet.getDouble("unit_price"));

                    // Add the product to the database cart table
                    String insertCartSql = "INSERT INTO cart (user_email, product_Id, quantity) VALUES (?, ?, ?)";
                    try (PreparedStatement insertStatement = connection.prepareStatement(insertCartSql)) {
                        insertStatement.setString(1, user.getEmail());
                        insertStatement.setInt(2, productId);
                        insertStatement.setInt(3, 1); // Default quantity is 1
                        insertStatement.executeUpdate();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Add the product to the session cart
        if (product != null) {
            ArrayList<ProductModel> cart = (ArrayList<ProductModel>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            cart.add(product);
            session.setAttribute("cart", cart);
        }

        // Redirect to the cart page
        response.sendRedirect("cart.jsp");
    }
}
