package MedicineOrderingSystem;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PharmasistCtrl {
	
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	public static boolean insertdata(String name, String email_address,String contact_no,String license_no,String specialization,Date dob,Date hire_date,String shift_timing,String password) {
		
		boolean isSuccess = false;
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			
			String sql ="insert into pharmacists values(0,'"+name+"','"+email_address+"','"+contact_no+"','"+license_no+"','"+specialization+"','"+dob+"','"+hire_date+"','"+shift_timing+"','"+password+"')";
			int rs= stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess =true;
			}
			else {
				isSuccess = false;
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	public static List<Pharmasist_model> getById(String pharmacist_id){
		
		int convertID = Integer.parseInt(pharmacist_id);
		
		ArrayList <Pharmasist_model> pharmacists = new ArrayList<>();
		
		try {
			
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			String sql ="select * from pharmacists where pharmacist_Id ='"+convertID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int  pharmacist_Id = rs.getInt(1);
				String name = rs.getString(2);
				String email_address = rs.getString(3);
				String contact_no = rs.getString(4);
				String license_no = rs.getString(5);
				String specialization = rs.getString(6);
				
				
			    Date dob = rs.getDate(7);  
			    Date hire_date = rs.getDate(8);  
				
				
				String shift_timing = rs.getString(9);
				String password = rs.getString(10);
				
				Pharmasist_model ph = new Pharmasist_model(pharmacist_Id,name, email_address,contact_no,license_no,specialization,dob,hire_date,shift_timing,password);
				pharmacists.add(ph);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return pharmacists;
		
	}
	
	
	public static List<Pharmasist_model> getAllPharmacists (){
		ArrayList <Pharmasist_model> pharmacists = new ArrayList<>();
		
		try {
			
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			String sql ="select * from pharmacists";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int  pharmacist_Id = rs.getInt(1);
				String name = rs.getString(2);
				String email_address = rs.getString(3);
				String contact_no = rs.getString(4);
				String license_no = rs.getString(5);
				String specialization = rs.getString(6);
				
				
			    Date dob = rs.getDate(7);  
			    Date hire_date = rs.getDate(8);  
				
				
				String shift_timing = rs.getString(9);
				String password = rs.getString(10);
				
				Pharmasist_model ph = new Pharmasist_model(pharmacist_Id,name, email_address,contact_no,license_no,specialization,dob,hire_date,shift_timing,password);
				pharmacists.add(ph);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return pharmacists;

		
		
	}
	
	public static boolean updatedata(String  pharmacist_Id ,String name,String email_address ,String contact_no,String license_no,String specialization, Date dob, Date hire_date,String shift_timing,String password) {
		try {
			
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			String sql = "update pharmacists set name='"+name+"', email_address='"+email_address+"', contact_no='"+contact_no+"', license_no='"+license_no+"', specialization='"+specialization+"', dob='"+dob+"', hire_date='"+hire_date+"', shift_timing='"+shift_timing+"', password='"+password+"' "
					+ "where pharmacist_Id='"+pharmacist_Id+"'";

			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess =true;
			}
			else {
				isSuccess = false;
				
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	public static boolean deletedata(String pharmacist_Id) {
		int convID = Integer.parseInt(pharmacist_Id);
		
		try {
			
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			String sql ="delete from pharmacists where pharmacist_Id='"+convID+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
				
			}
			else {
				isSuccess = false;
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	
	

}
