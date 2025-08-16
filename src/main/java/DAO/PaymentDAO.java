package DAO;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBContext;
import Model.Payment;

public class PaymentDAO extends DBContext {
    public Payment getPaymentByOrderId(int orderId) throws SQLException {
        String query = "SELECT * FROM Payment WHERE order_id = ?";
        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Payment p = new Payment();
                p.setPaymentId(rs.getInt("payment_id"));
                p.setMethod(rs.getString("payment_method"));
                p.setDate(rs.getDate("payment_date"));
                p.setAmount(rs.getBigDecimal("payment_amount"));
                p.setTransactionId(rs.getString("transaction_id"));
                p.setStatus(rs.getString("payment_status"));
                p.setOrderId(rs.getInt("order_id"));
                return p;
            }
        }
        return null;
    }

    public void createPayment(int orderId, String method, String status, String transactionId, long totalPrice) throws SQLException {
        String sql = "INSERT INTO Payment (payment_method, payment_date, payment_amount, transaction_id, payment_status, order_id) "
                + "VALUES (?, GETDATE(), ?, ?, ?, ?)";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, method);
            ps.setLong(2, totalPrice); 
            ps.setString(3, transactionId); 
            ps.setString(4, status);
            ps.setInt(5, orderId);
            ps.executeUpdate();
        }
    }

}
