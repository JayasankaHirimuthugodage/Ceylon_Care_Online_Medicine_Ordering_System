package MOSContactUs;

import MedicineOrderingSystem.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ContactUsDBUtil {

    // Method to insert a message
    public static boolean insertMessage(Message message) {
        boolean isSuccess = false;
        String sql = "INSERT INTO message (firstName, lastName, email, description, date, opEmail) VALUES (?, ?, ?, ?, NOW(),?)";

        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
        	
        	pstmt.setString(1, message.getFirstName());  
            pstmt.setString(2, message.getLastName());    
            pstmt.setString(3, message.getEmail());       
            pstmt.setString(4, message.getDescription()); 
            pstmt.setString(5, message.getOpEmail());
            
            int rowsAffected = pstmt.executeUpdate();
            isSuccess = (rowsAffected > 0);
            
        } catch (SQLException e) {
        	
            System.err.println("SQL Exception: " + e.getMessage());
            
        }

        return isSuccess;
    }

    // Method to get messages for a specific email
    public static List<Message> getMessages(String email) {
    	
        List<Message> messages = new ArrayList<>();
        
        String sql = "SELECT * FROM message WHERE email = ?";

        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
        	
            pstmt.setString(1, email);
            
            try (ResultSet rs = pstmt.executeQuery()) {
            	
                while (rs.next()) {
                	
                    int id = rs.getInt(1);
                    String firstName = rs.getString(2);
                    String lastName = rs.getString(3);
                    String description = rs.getString(5);
                    Timestamp dateTime = rs.getTimestamp(6);
                    String opEmail = rs.getString(7);
                    Message msg = new Message(id, firstName, lastName, null, description, dateTime, opEmail);
                    messages.add(msg);
                    System.out.println("Retrieved message for email: " + email);
                    
                }
            }
        } catch (SQLException e) {
        	
            System.err.println("SQL Exception: " + e.getMessage());
            
        }

        return messages;
    }

    // Method to update a message
    public static boolean updateMessage(String id, String firstName, String lastName, String opEmail, String description) {
        boolean isSuccess = false;
        String sql = "UPDATE message SET firstName = ?, lastName = ?, opEmail = ?, description = ?, date = NOW() WHERE message_id = ?";//******

        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
        	
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, opEmail);
            pstmt.setString(4, description);
            pstmt.setInt(5, Integer.parseInt(id));
            int rowsAffected = pstmt.executeUpdate();
            isSuccess = (rowsAffected > 0);
            
        } catch (SQLException e) {
        	
            System.err.println("SQL Exception: " + e.getMessage());
            
        }

        return isSuccess;
    }

    // Method to delete a message
    public static boolean deleteMessage(String id) {
        boolean isSuccess = false;
        String sql = "DELETE FROM message WHERE message_id = ?";

        try (Connection con = DBConnection.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
        	
            pstmt.setInt(1, Integer.parseInt(id));
            int rowsAffected = pstmt.executeUpdate();
            isSuccess = (rowsAffected > 0);
            
        } catch (SQLException e) {
        	
            System.err.println("SQL Exception: " + e.getMessage());
            
        }

        return isSuccess;
    }
}
