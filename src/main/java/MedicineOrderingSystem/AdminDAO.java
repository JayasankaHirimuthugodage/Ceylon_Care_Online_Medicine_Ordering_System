package MedicineOrderingSystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    
    public Admin getAdminByUsername(String username) {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE username = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setEmail(rs.getString("email"));
                admin.setResetToken(rs.getString("reset_token"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    
    public Admin getAdminByToken(String token) {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE reset_token = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, token);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setEmail(rs.getString("email"));
                admin.setResetToken(rs.getString("reset_token"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

   
    public boolean updatePasswordByToken(String token, String newPassword) {
    	
        String query = "UPDATE admin SET password = ?, reset_token = NULL WHERE reset_token = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, newPassword);
            pstmt.setString(2, token);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public Admin getAdminByUsernameAndPassword(String username, String password) {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password); 
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setEmail(rs.getString("email"));
                admin.setResetToken(rs.getString("reset_token"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    
    public void saveResetToken(String username, String resetToken) {
    	
        String query = "UPDATE admin SET reset_token = ? WHERE username = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, resetToken);
            pstmt.setString(2, username);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
