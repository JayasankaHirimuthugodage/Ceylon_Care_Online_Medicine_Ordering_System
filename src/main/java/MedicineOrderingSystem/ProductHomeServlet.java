//ProductHomeServlet.java
package MedicineOrderingSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductHomeServlet")
public class ProductHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductModel> productList = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();
            String sql = "SELECT product_Id, product_name, description, image_url, quantity, unit_price   FROM products";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                ProductModel product = new ProductModel();
                product.setProduct_Id(resultSet.getInt("product_Id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setDescription(resultSet.getString("description"));
                product.setImageURL(resultSet.getString("image_url")); 
                product.setQuantity(resultSet.getInt("quantity")); 
                product.setUnitPrice(resultSet.getDouble("unit_price")); 
                productList.add(product);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("allProducts", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ProductHome.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
