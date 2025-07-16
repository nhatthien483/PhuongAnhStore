package Model;

import java.math.BigDecimal;
import java.sql.Date;

public class Payment {
    private int paymentId;
    private String method;
    private Date date;
    private BigDecimal amount;
    private String transactionId;
    private String status;
    private int orderId;

    // getters & setters
    public Payment() {
    }

    public Payment(int paymentId, String method, Date date, BigDecimal amount, String transactionId, String status, int orderId) {
        this.paymentId = paymentId;
        this.method = method;
        this.date = date;
        this.amount = amount;
        this.transactionId = transactionId;
        this.status = status;
        this.orderId = orderId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
