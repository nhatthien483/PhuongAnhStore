package Model;

public class Category {
    private int categoryId;
    private String categoryName;

    // getters & setters
    public Category() {
    }
    public Category(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryType(String categoryType) {
        this.categoryName = categoryType;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
