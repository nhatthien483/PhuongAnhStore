package DAO;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.Order;
import Model.User;

public class OrderDAO extends DBContext {
    public static void main(String[] args) throws SQLException {
        OrderDAO oDAO = new OrderDAO();
        boolean success = oDAO.updateOrderStatus(2, "Đang vận chuyển");
        if (success) {
            System.out.println("Successs");
        }else{
            System.out.println("Faile");
        }
    }

    public boolean updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE [Order] SET order_status = ? WHERE order_id = ?";
        try (Connection con = this.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

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

    public List<Order> getAllOrders() throws SQLException {
        List<Order> list = new ArrayList<>();

        String query = "SELECT o.order_id, o.user_id, o.order_price, o.order_status, "
                + "o.order_date, o.voucher_id, "
                + "u.username, u.user_email, u.user_fullname,u.user_address, u.user_phone "
                + "FROM [Order] o "
                + "JOIN [User] u ON o.user_id = u.user_id "
                + "ORDER BY o.order_date DESC";

        try (Connection con = this.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setPrice(rs.getBigDecimal("order_price"));
                o.setStatus(rs.getString("order_status"));
                o.setOrderDate(rs.getDate("order_date"));
                o.setVoucherId(rs.getInt("voucher_id"));

                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("user_email"));
                u.setFullName(rs.getString("user_fullname"));
                u.setAddress(rs.getString("user_address"));
                u.setPhone(rs.getString("user_phone"));
                o.setUser(u);
                list.add(o);
            }
        }

        return list;
    }

    public List<Order> getOrderByPage(int page, int pageSize) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "SELECT o.order_id, o.user_id, o.order_price, o.order_status, "
                + "o.order_date, o.voucher_id, "
                + "u.username, u.user_email, u.user_fullname, u.user_address, u.user_phone "
                + "FROM [Order] o "
                + "JOIN [User] u ON o.user_id = u.user_id "
                + "ORDER BY o.order_date DESC, o.order_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            int offset = (page - 1) * pageSize;
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("order_id"));
                    o.setUserId(rs.getInt("user_id"));
                    o.setPrice(rs.getBigDecimal("order_price"));
                    o.setStatus(rs.getString("order_status"));
                    o.setOrderDate(rs.getDate("order_date"));
                    o.setVoucherId(rs.getInt("voucher_id"));

                    User u = new User();
                    u.setUserId(rs.getInt("user_id"));
                    u.setUsername(rs.getString("username"));
                    u.setEmail(rs.getString("user_email"));
                    u.setFullName(rs.getString("user_fullname"));
                    u.setAddress(rs.getString("user_address"));
                    u.setPhone(rs.getString("user_phone"));

                    o.setUser(u);
                    list.add(o);
                }
            }
        }
        return list;
    }

    public int countAll() {
        String sql = "SELECT COUNT(*) AS total FROM [Order]";
        int count = 0;
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int createOrderFromCart(int userId, Integer voucherId) throws SQLException {
        int orderId = -1;
        Connection conn = this.getConnection();
        try {
            conn.setAutoCommit(false);

            // 1. Lấy cart theo user
            String cartQuery = "SELECT cart_id, cart_price FROM Cart WHERE user_id = ?";
            int cartId = 0;
            double cartPrice = 0;

            try (PreparedStatement ps = conn.prepareStatement(cartQuery)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        cartId = rs.getInt("cart_id");
                        cartPrice = rs.getDouble("cart_price");
                    } else {
                        throw new SQLException("Cart not found for userId: " + userId);
                    }
                }
            }

            // 2. Insert Order
            String insertOrder = "INSERT INTO [Order] (user_id, order_price, order_status, order_date, voucher_id) "
                    + "VALUES (?, ?, ?, GETDATE(), ?)";
            try (PreparedStatement ps = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, userId);
                ps.setDouble(2, cartPrice);
                ps.setString(3, "Chờ xác nhận");
                if (voucherId != null) {
                    ps.setInt(4, voucherId);
                } else {
                    ps.setNull(4, Types.INTEGER);
                }
                ps.executeUpdate();

                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    }
                }
            }

            // 3. Insert OrderDetail từ CartDetail
            String cartDetailQuery = "SELECT cd.product_id, cd.quantity, p.product_name, p.product_price "
                    + "FROM CartDetail cd "
                    + "JOIN Product p ON cd.product_id = p.product_id "
                    + "WHERE cd.cart_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(cartDetailQuery)) {
                ps.setInt(1, cartId);
                try (ResultSet rs = ps.executeQuery()) {
                    String insertDetail = "INSERT INTO OrderDetail (order_id, product_id, product_quantity, product_name_snapshot, product_price_snapshot) "
                            + "VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement psDetail = conn.prepareStatement(insertDetail)) {
                        while (rs.next()) {
                            psDetail.setInt(1, orderId);
                            psDetail.setInt(2, rs.getInt("product_id"));
                            psDetail.setInt(3, rs.getInt("quantity"));
                            psDetail.setString(4, rs.getString("product_name"));
                            psDetail.setDouble(5, rs.getDouble("product_price"));
                            psDetail.addBatch();
                        }
                        psDetail.executeBatch();
                    }
                }
            }

            // 4. Xóa Cart sau khi đặt hàng (tuỳ nhu cầu)
            String deleteDetail = "DELETE FROM CartDetail WHERE cart_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(deleteDetail)) {
                ps.setInt(1, cartId);
                ps.executeUpdate();
            }
            String deleteCart = "DELETE FROM Cart WHERE cart_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(deleteCart)) {
                ps.setInt(1, cartId);
                ps.executeUpdate();
            }

            conn.commit();
        } catch (Exception e) {
            conn.rollback();
            throw e;
        } finally {
            conn.setAutoCommit(true);
        }

        return orderId;
    }
}
