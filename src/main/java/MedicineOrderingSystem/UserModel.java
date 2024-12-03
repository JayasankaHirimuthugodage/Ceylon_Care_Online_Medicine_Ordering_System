package MedicineOrderingSystem;

public class UserModel {
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;
    private String password;
    private String daddress;
    private String originalEmail; // Field for original email

    // Constructor
    public UserModel( String firstName, String lastName, String phoneNumber, String email, String password, String daddress) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
        this.daddress = daddress;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    

    public String getDaddress() {
		return daddress;
	}

	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}

	// Setters (if needed)
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getOriginalEmail() {
		return originalEmail;
	}

	public void setOriginalEmail(String originalEmail) {
		this.originalEmail = originalEmail;
	}
}
