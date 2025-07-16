package Model;

public class CategoryType {
    private int categoryTypeId;
    private String categoryTypeName;
    private Category category;

    // getters & setters
    public CategoryType() {
    }

    public CategoryType(int categoryTypeId, String categoryTypeName) {
        this.categoryTypeId = categoryTypeId;
        this.categoryTypeName = categoryTypeName;
    }

    public CategoryType(int categoryTypeId, String categoryTypeName, Category category) {
        this.categoryTypeId = categoryTypeId;
        this.categoryTypeName = categoryTypeName;
        this.category = category;
    }

    public int getCategoryTypeId() {
        return categoryTypeId;
    }

    public void setCategoryTypeId(int categoryTypeId) {
        this.categoryTypeId = categoryTypeId;
    }

    public String getCategoryTypeName() {
        return categoryTypeName;
    }

    public void setCategoryTypeName(String categoryTypeName) {
        this.categoryTypeName = categoryTypeName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
