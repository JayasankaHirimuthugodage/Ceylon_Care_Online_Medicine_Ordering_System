package MOSContactUs;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Message {
	
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String description;
	private Timestamp dateTime;
	private String opEmail;
	
	public Message(int id, String firstName, String lastName, String email, String description, Timestamp dateTime, String opEmail) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.description = description;
		this.dateTime = dateTime;
		this.opEmail = opEmail;
	}
	
	public int getId() {
        return id;
    }
	
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getDescription() {
		return description;
	}
	
	public Timestamp getDateTime() {
		return dateTime;
	}
	
	public String getFormattedDateTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateTime != null ? sdf.format(dateTime) : "No Date Available";
    }
	
	public String getOpEmail() {
        return opEmail;
    }

}
