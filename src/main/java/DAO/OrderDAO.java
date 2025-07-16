package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.Order;

public class OrderDAO extends DBContext {
    public List<Order> getOrdersByUserId(int userId) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM [Order] WHERE user_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setPrice(rs.getBigDecimal("order_price"));
                o.setStatus(rs.getString("order_status"));
                o.setOrderDate(rs.getDate("order_date"));
                o.setVoucherId(rs.getInt("voucher_id"));
                list.add(o);
            }
        }
        return list;
    }
}
