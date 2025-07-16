package Model;

import java.math.BigDecimal;
import java.sql.Date;

public class Order {
    private int orderId;
    private int userId;
    private BigDecimal price;
    private String status;
    private Date orderDate;
    private int voucherId;

    // getters & setters
    public Order(int orderId, int userId, BigDecimal price, String status, Date orderDate, int voucherId) {
        this.orderId = orderId;
        this.userId = userId;
        this.price = price;
        this.status = status;
        this.orderDate = orderDate;
        this.voucherId = voucherId;
    }
    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }
}
