package MedicineOrderingSystem;

public class Card {
    private int id;
    private String cardNumber;
    private String cardHolderName;
    private String expirationDate;
    private String cvv;
	private String email;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

	public void setEmail(String email) {
		// TODO Auto-generated method stub
		this.email = email;
	}

	public String getEmail() {
		// TODO Auto-generated method stub
		return email;
	}
}
