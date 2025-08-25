package Model;

import java.sql.Date;

public class Comment {
    private int commentId;
    private int productId;
    private Date commentDate;
    private int userId;
    private String commentText;
    private User user;
    private Product product;
    private String userFullname; // thêm thuộc tính username

    // getters & setters

    public Comment(int commentId, int productId, Date commentDate, int userId, String commentText) {
        this.commentId = commentId;
        this.productId = productId;
        this.commentDate = commentDate;
        this.userId = userId;
        this.commentText = commentText;
    }
    

    public Comment() {
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }


    public User getUser() {
        return user;
    }


    public void setUser(User user) {
        this.user = user;
    }


    public String getUserFullname() {
        return userFullname;
    }


    public void setUserFullname(String userFullname) {
        this.userFullname = userFullname;
    }


    public Product getProduct() {
        return product;
    }


    public void setProduct(Product product) {
        this.product = product;
    }
}
