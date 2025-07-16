package DAO;

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
}
