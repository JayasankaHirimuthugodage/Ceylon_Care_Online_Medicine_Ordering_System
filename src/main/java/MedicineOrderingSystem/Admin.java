package MedicineOrderingSystem;

public class Admin {
    private int id;              
    private String username;     
    private String password;     
    private String email;        
    private String resetToken;   

    
    public Admin() {
    }

    
    public Admin(int id, String username, String password, String email, String resetToken) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.resetToken = resetToken;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getResetToken() {
        return resetToken;
    }

    public void setResetToken(String resetToken) {
        this.resetToken = resetToken;
    }
}
