package Model;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

public class Product {
    private int productId;
    private String name;
    private BigDecimal price;
    private String brand;
    private String image; // Tên file ảnh, ví dụ: "laptop01.png"
    private String video;
    private int stock;
    private boolean restock;
    private String description;
    private String note;
    private Date createAt;
    private Date updateAt;
    private boolean status;
    private String type;

    private Category category; // Danh mục lớn
    private CategoryType categoryType; // Danh mục nhỏ

    public Product() {
    }

    public Product(int productId, String name, BigDecimal price, String brand, String image, String video,
            int stock, boolean restock, String description, String note, Date createAt, Date updateAt,
            boolean status, String type, Category category, CategoryType categoryType) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.brand = brand;
        this.image = image;
        this.video = video;
        this.stock = stock;
        this.restock = restock;
        this.description = description;
        this.note = note;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
        this.type = type;
        this.category = category;
        this.categoryType = categoryType;
    }

    public String getImagePath() {
        if (category == null || categoryType == null || image == null)
            return "";
        return category.getCategoryName().replace(" ", "-") + "/" +
                categoryType.getCategoryTypeName().replace(" ", "-") + "/" +
                image;
    }

    public String getFormattedPrice() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(price);
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public boolean isRestock() {
        return restock;
    }

    public void setRestock(boolean restock) {
        this.restock = restock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public CategoryType getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(CategoryType categoryType) {
        this.categoryType = categoryType;
    }
}
