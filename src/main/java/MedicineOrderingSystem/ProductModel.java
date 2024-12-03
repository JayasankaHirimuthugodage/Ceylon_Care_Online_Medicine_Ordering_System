//ProductModel.java
package MedicineOrderingSystem;


public class ProductModel {
    private int product_Id;
    private String productName;
    private String description;
    private String imageURL;
    private int quantity;
    private double unitPrice;

    public ProductModel(int product_Id, String productName, String description, String imageURL, int quantity, double unitPrice) {
        this.product_Id = product_Id;
        this.productName = productName;
        this.description = description;
        this.imageURL = imageURL;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public ProductModel() {
 	}

	// Getters and Setters for each field
    public int getProduct_Id() {
        return product_Id;
    }

    public void setProduct_Id(int product_Id) {
        this.product_Id = product_Id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
}
