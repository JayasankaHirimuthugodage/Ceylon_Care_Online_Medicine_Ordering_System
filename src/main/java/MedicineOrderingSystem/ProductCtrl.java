//ProductCtrl.java
package MedicineOrderingSystem;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductCtrl {

    // Database connection variables
    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Insert Product Data Function
    public static boolean insertProduct(String productName, String description, String imageURL, int quantity, double unitPrice) {
        boolean isSuccess = false;
        try {
            // DB Connection
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL Query to insert product data
            String sql = "INSERT INTO products VALUES (0, '" + productName + "', '" + description + "', '" + imageURL + "', " + quantity + ", " + unitPrice + ")";
            int rs = stmt.executeUpdate(sql);
            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Get Product By ID
    public static List<ProductModel> getProductById(String productId) {
        int convertID = Integer.parseInt(productId);
        ArrayList<ProductModel> products = new ArrayList<>();

        try {
            // DB Connection
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL Query to get product by ID
            String sql = "SELECT * FROM products WHERE product_Id = '" + convertID + "'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int product_Id = rs.getInt(1);
                String productName = rs.getString(2);
                String description = rs.getString(3);
                String imageURL = rs.getString(4);
                int quantity = rs.getInt(5);
                double unitPrice = rs.getDouble(6);

                // Creating a new product object and adding to the list
                ProductModel product = new ProductModel(product_Id, productName, description, imageURL, quantity, unitPrice);
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    // Get All Products
    public static List<ProductModel> getAllProducts() {
        ArrayList<ProductModel> products = new ArrayList<>();

        try {
            // DB Connection
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL Query to get all products
            String sql = "SELECT * FROM products";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int product_Id = rs.getInt(1);
                String productName = rs.getString(2);
                String description = rs.getString(3);
                String imageURL = rs.getString(4);
                int quantity = rs.getInt(5);
                double unitPrice = rs.getDouble(6);

                // Creating a new product object and adding to the list
                ProductModel product = new ProductModel(product_Id, productName, description, imageURL, quantity, unitPrice);
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

 // Delete Product By ID
    public static boolean deleteProduct(int productId) {
        boolean isSuccess = false;
        try {
            // Establish a database connection
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL Query to delete the product
            String sql = "DELETE FROM products WHERE product_id = " + productId;
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Update Product Data
    public static boolean updateProduct(int productId, String productName, String description, String imageURL, int quantity, double unitPrice) {
        boolean isSuccess = false;
        try {
            // DB Connection
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL Query to update product data
            String sql = "UPDATE products SET product_name = '" + productName + "', description = '" + description + "', image = '" + imageURL + "', quantity = " + quantity + ", unit_price = " + unitPrice + " WHERE product_id = " + productId;
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
    


//	public static boolean updateProduct(String productId, String productName, String description, int quantity,
//			double unitPrice, String fileName) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
////	public static boolean deleteProduct(int productId) {
//		// TODO Auto-generated method stub
//		return false;
//	}

//	public static boolean updateProduct(ProductModel product) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	public static boolean updateProduct(int productId, String productName, String description, String fileName,
//			int quantity, double unitPrice) {
//		// TODO Auto-generated method stub
//		return false;
//	}
}
