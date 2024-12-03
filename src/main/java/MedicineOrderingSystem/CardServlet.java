package MedicineOrderingSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/card")
public class CardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CardDAO cardDAO;

    @Override
    public void init() throws ServletException {
        cardDAO = new CardDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");

        if (user != null) {
            String email = user.getEmail();
            String action = request.getParameter("action");

            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Card existingCard = cardDAO.getCardById(id);
                request.setAttribute("card", existingCard);
                request.getRequestDispatcher("editCard.jsp").forward(request, response);
            } else if ("delete".equals(action)) {
                deleteCard(request, response, email);
            } else {
                listCards(request, response, email);
            }
        } else {
            response.sendRedirect("login.jsp"); // Redirect to login if the user is not logged in
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");

        if (user != null) {
            String email = user.getEmail();
            String action = request.getParameter("action");

            if ("update".equals(action)) {
                updateCard(request, response, email);
            } else {
                addCard(request, response, email);
            }
        } else {
            response.sendRedirect("login.jsp"); // Redirect to login if the user is not logged in
        }
    }

    private void addCard(HttpServletRequest request, HttpServletResponse response, String email) throws IOException {
        String cardNumber = request.getParameter("card_number");
        String cardHolderName = request.getParameter("card_holder_name");
        String expirationDate = request.getParameter("expiration_date");
        String cvv = request.getParameter("cvv");

        Card card = new Card();
        card.setCardNumber(cardNumber);
        card.setCardHolderName(cardHolderName);
        card.setExpirationDate(expirationDate);
        card.setCvv(cvv);
        card.setEmail(email); // Save the email

        cardDAO.saveCard(card);
        response.sendRedirect("card");
    }

    private void updateCard(HttpServletRequest request, HttpServletResponse response, String email) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String cardNumber = request.getParameter("card_number");
        String cardHolderName = request.getParameter("card_holder_name");
        String expirationDate = request.getParameter("expiration_date");
        String cvv = request.getParameter("cvv");

        Card card = new Card();
        card.setId(id);
        card.setCardNumber(cardNumber);
        card.setCardHolderName(cardHolderName);
        card.setExpirationDate(expirationDate);
        card.setCvv(cvv);
        card.setEmail(email); // Update the email

        cardDAO.updateCard(card);
        response.sendRedirect("card");
    }

    private void deleteCard(HttpServletRequest request, HttpServletResponse response, String email) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cardDAO.deleteCard(id, email); // Pass the email to ensure only the user's card is deleted
        response.sendRedirect("card");
    }

    private void listCards(HttpServletRequest request, HttpServletResponse response, String email) throws ServletException, IOException {
        List<Card> cards = cardDAO.getCardsByEmail(email); // Retrieve cards by email
        request.setAttribute("cards", cards);
        request.getRequestDispatcher("viewCards.jsp").forward(request, response);
    }
}
