package MedicineOrderingSystem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class admin_userUserServiceImpl implements admin_userUserService {
    private Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }

    @Override
    public boolean insertUser(UserModel user) {
    	
        String sql = "INSERT INTO users (firstName, lastName, phoneNumber, email, password, daddress) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection();//getting the database connection.
        	
        	//SQL statement
            PreparedStatement ps = conn.prepareStatement(sql)) {
        	
        	//setting values for the SQL statement by using user's data
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getDaddress());
            
            return ps.executeUpdate() > 0;//this executes the query and checks whether the row was added or not successfully
            //return true if the insert is successful
            
        } catch (SQLException e) {
            e.printStackTrace(); 
            return false;
        }
    }

    public boolean isEmailTakenByOtherUser(String newEmail, String originalEmail) {
    	
    	// This query checks if the newly entered email already exists for someone else in the database.
        String sql = "SELECT COUNT(*) FROM users WHERE email = ? AND email != ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	
        	// Set the newly entered email which is checking and the original email to exclude
            ps.setString(1, newEmail);
            ps.setString(2, originalEmail);
            
            // Executing the query to see if the email is already taken
            ResultSet rs = ps.executeQuery();
            
            //Condition for checking whether the count of the email is greater than 0
            if (rs.next()) {
                return rs.getInt(1) > 0; 
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return false; // Return false if there are no other users with this email.
    }

    @Override
    public boolean updateUser(UserModel user) {
    	
        // Check if the email is being changed and if it has already taken by another user
        if (isEmailTakenByOtherUser(user.getEmail(), user.getOriginalEmail())) {
        	
            throw new IllegalArgumentException("Email is already taken by another user."); 
        }

        String sql = "UPDATE users SET firstName = ?, lastName = ?, phoneNumber = ?, password = ?, daddress = ? WHERE email = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getDaddress());
            ps.setString(6, user.getOriginalEmail()); //need the original email to find the correct user to update
            
            return ps.executeUpdate() > 0; // If the update affected at least one row, return true
        } catch (SQLException e) {
        	
            e.printStackTrace(); 
            return false;
        }
    }

    @Override
    public boolean deleteUser(String email) {
    	
        String sql = "DELETE FROM users WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	
            ps.setString(1, email);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
        	
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<UserModel> getAllUsers() {
    	
        List<UserModel> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
        	
            while (rs.next()) {
            	
                users.add(new UserModel(
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("phoneNumber"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("daddress")
                ));
            }
        } catch (SQLException e) {
        	
            e.printStackTrace(); 
        }
        return users;
    }

    @Override
    public UserModel getUserByEmail(String email) {
    	
        UserModel user = null;
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
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
        } catch (SQLException e) {
        	
            e.printStackTrace(); 
        }
        return user;
    }

    @Override
    public boolean emailExists(String email) {
    	
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
        	
            e.printStackTrace();
        }
        return false;
    }
}
