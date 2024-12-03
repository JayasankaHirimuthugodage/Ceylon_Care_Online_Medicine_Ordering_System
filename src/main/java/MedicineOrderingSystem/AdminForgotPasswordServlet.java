package MedicineOrderingSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.UUID;

@WebServlet("/AdminForgotPasswordServlet")
public class AdminForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.getAdminByUsername(username);

        if (admin != null) {
            
            String resetToken = UUID.randomUUID().toString();
            adminDAO.saveResetToken(admin.getUsername(), resetToken);

            
            String resetLink = "http://localhost:8090/OMDOS/adminResetPassword.jsp?token=" + resetToken;
            boolean emailSent = sendResetEmail(admin.getEmail(), resetLink);

            if (emailSent) {
                request.setAttribute("message", "Password reset link has been sent to your email.");
                request.getRequestDispatcher("adminForgotPassword.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Unable to send email. Please try again.");
                request.getRequestDispatcher("adminForgotPassword.jsp").forward(request, response);
            }

        } else {
            response.sendRedirect("adminForgotPassword.jsp?error=Username not found");
        }
    }

    private boolean sendResetEmail(String recipientEmail, String resetLink) {
        
        final String senderEmail = "ceyloncarewebproject@gmail.com"; 
        final String senderPassword = "kcaoizamizrfjjuy"; 

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Password Reset Request");
            message.setText("Dear Admin,\n\nClick the following link to reset your password:\n" + resetLink);
           

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
