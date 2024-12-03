package MedicineOrderingSystem;

import java.sql.Date; 

public class Pharmasist_model {
	
	private int pharmacist_Id;
	private String name;
	private String email_address;
	private String contact_no;
	private String license_no;
	private String specialization;
	private Date dob;
	private Date hire_date;
	private String shift_timing;
	private String password;
	
	public Pharmasist_model(int pharmacist_Id, String name, String email_address, String contact_no, String license_no,
			String specialization, Date dob, Date hire_date, String shift_timing, String password) {
		
		super();
		this.pharmacist_Id = pharmacist_Id;
		this.name = name;
		this.email_address = email_address;
		this.contact_no = contact_no;
		this.license_no = license_no;
		this.specialization = specialization;
		this.dob = dob;
		this.hire_date = hire_date;
		this.shift_timing = shift_timing;
		this.password = password;
	}

	
	
	public int getPharmacist_Id() {
		return pharmacist_Id;
	}

	public void setPharmacist_Id(int pharmacist_Id) {
		this.pharmacist_Id = pharmacist_Id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail_address() {
		return email_address;
	}

	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getLicense_no() {
		return license_no;
	}

	public void setLicense_no(String license_no) {
		this.license_no = license_no;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getHire_date() {
		return hire_date;
	}

	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}

	public String getShift_timing() {
		return shift_timing;
	}

	public void setShift_timing(String shift_timing) {
		this.shift_timing = shift_timing;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
	
	

}
