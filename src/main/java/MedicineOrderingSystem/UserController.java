package MedicineOrderingSystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserController {

    // Method to register a new user
    public static boolean registerUser(UserModel user) {
        boolean isRegistered = false;

        String sql = "INSERT INTO users (firstName, lastName, phoneNumber, email, password,daddress) VALUES (?, ?, ?, ?, ?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set the user details into the prepared statement
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getPhoneNumber());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getDaddress() );
            

            // Execute the insert query
            int rowsInserted = stmt.executeUpdate();

            // Check if a row was inserted
            if (rowsInserted > 0) {
                isRegistered = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isRegistered;
    }

    // Method to check if a user exists by email (for example during login)
    public static UserModel getUserByEmail(String email) {
        UserModel user = null;
        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set email for the query
            stmt.setString(1, email);
             // Execute the query
            ResultSet rs = stmt.executeQuery();
        	//System.out.println("dddddd");

            // If user exists, map the result to a UserModel object
            if (rs.next()) {
                user = new UserModel(
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("phoneNumber"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("daddress")
                );
            	System.out.println( rs.getString("password"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    // Method to update user profile
    public static boolean updateUserProfile(UserModel user) {
        boolean isUpdated = false;

        String sql = "UPDATE users SET firstName = ?, lastName = ?, phoneNumber = ?, email = ?, password = ?, daddress=?  WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set the new user details
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getPhoneNumber());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getDaddress());
            stmt.setString(7, user.getEmail());


            // Execute the update query
            int rowsUpdated = stmt.executeUpdate();
 

            // Check if the row was updated
            if (rowsUpdated > 0) {
                isUpdated = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    // Method to get user by ID (for profile retrieval)
    public static UserModel getUserById(int userId) {
        UserModel user = null;
        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set user ID for the query
            stmt.setInt(1, userId);

            // Execute the query
            ResultSet rs = stmt.executeQuery();

            // If user is found, map the result to a UserModel object
            if (rs.next()) {
                user = new UserModel(
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("phoneNumber"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("daddress")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
