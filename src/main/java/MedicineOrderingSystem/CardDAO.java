package MedicineOrderingSystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CardDAO {
    public void saveCard(Card card) {
        String sql = "INSERT INTO card (card_number, card_holder_name, expiration_date, cvv, email) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, card.getCardNumber());
            stmt.setString(2, card.getCardHolderName());
            stmt.setString(3, card.getExpirationDate());
            stmt.setString(4, card.getCvv());
            stmt.setString(5, card.getEmail()); // Save the email
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Card> getCardsByEmail(String email) {
        List<Card> cards = new ArrayList<>();
        String sql = "SELECT * FROM card WHERE email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Card card = new Card();
                    card.setId(rs.getInt("id"));
                    card.setCardNumber(rs.getString("card_number"));
                    card.setCardHolderName(rs.getString("card_holder_name"));
                    card.setExpirationDate(rs.getString("expiration_date"));
                    card.setCvv(rs.getString("cvv"));
                    card.setEmail(rs.getString("email")); // Set the email
                    cards.add(card);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cards;
    }

    public Card getCardById(int id) {
        Card card = null;
        String sql = "SELECT * FROM card WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    card = new Card();
                    card.setId(rs.getInt("id"));
                    card.setCardNumber(rs.getString("card_number"));
                    card.setCardHolderName(rs.getString("card_holder_name"));
                    card.setExpirationDate(rs.getString("expiration_date"));
                    card.setCvv(rs.getString("cvv"));
                    card.setEmail(rs.getString("email")); // Set the email
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return card;
    }

    public void updateCard(Card card) {
        String sql = "UPDATE card SET card_number=?, card_holder_name=?, expiration_date=?, cvv=? WHERE id=? AND email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, card.getCardNumber());
            stmt.setString(2, card.getCardHolderName());
            stmt.setString(3, card.getExpirationDate());
            stmt.setString(4, card.getCvv());
            stmt.setInt(5, card.getId());
            stmt.setString(6, card.getEmail()); // Filter by email
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCard(int id, String email) {
        String sql = "DELETE FROM card WHERE id=? AND email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.setString(2, email); // Filter by email
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
