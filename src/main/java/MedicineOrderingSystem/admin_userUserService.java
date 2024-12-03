package MedicineOrderingSystem;

import java.util.List;

public interface admin_userUserService {
	
    boolean insertUser(UserModel user);
    boolean updateUser(UserModel user);
    boolean deleteUser(String email);
    
    List<UserModel> getAllUsers();
    
    UserModel getUserByEmail(String email);
    boolean emailExists(String email);
    boolean isEmailTakenByOtherUser(String newEmail, String originalEmail); 
    
}
