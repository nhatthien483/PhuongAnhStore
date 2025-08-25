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
import Model.OrderDetail;
import Model.Payment;
import Model.User;

public class OrderDAO extends DBContext {
    public static void main(String[] args) throws SQLException {
        OrderDAO oDAO = new OrderDAO();
        boolean success = oDAO.updateOrderStatus(2, "Đang vận chuyển");
        if (success) {
            System.out.println("Successs");
        } else {
            System.out.println("Faile");
        }
    }

    public boolean updateOrderStatus(int orderId, String newStatus) {
        String sqlUpdateOrder = "UPDATE [Order] SET order_status = ? WHERE order_id = ?";
        String sqlGetPayment = "SELECT payment_id, payment_method FROM Payment WHERE order_id = ?";
        Connection con = null;
        try {
            con = this.getConnection();
            con.setAutoCommit(false);

            // 1. Update stock nếu cần (giống phần mình đưa trước đó)
            String sqlOrderDetail = "SELECT product_id, product_quantity FROM OrderDetail WHERE order_id = ?";
            List<int[]> productList = new ArrayList<>();

            try (PreparedStatement ps = con.prepareStatement(sqlOrderDetail)) {
                ps.setInt(1, orderId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        productList.add(new int[] { rs.getInt("product_id"), rs.getInt("product_quantity") });
                    }
                }
            }

            if ("DaXacNhan".equals(newStatus)) {
                String sqlUpdateStock = "UPDATE Product SET product_stock = product_stock - ? WHERE product_id = ?";
                try (PreparedStatement ps = con.prepareStatement(sqlUpdateStock)) {
                    for (int[] p : productList) {
                        ps.setInt(1, p[1]);
                        ps.setInt(2, p[0]);
                        ps.addBatch();
                    }
                    ps.executeBatch();
                }
            } else if ("DaHuy".equals(newStatus)) {
                String sqlUpdateStock = "UPDATE Product SET product_stock = product_stock + ? WHERE product_id = ?";
                try (PreparedStatement ps = con.prepareStatement(sqlUpdateStock)) {
                    for (int[] p : productList) {
                        ps.setInt(1, p[1]);
                        ps.setInt(2, p[0]);
                        ps.addBatch();
                    }
                    ps.executeBatch();
                }
            }

            // 2. Update trạng thái đơn hàng
            try (PreparedStatement ps = con.prepareStatement(sqlUpdateOrder)) {
                ps.setString(1, newStatus);
                ps.setInt(2, orderId);
                ps.executeUpdate();
            }

            // 3. Kiểm tra payment để cập nhật payment_status
            String paymentMethod = null;
            int paymentId = -1;
            try (PreparedStatement ps = con.prepareStatement(sqlGetPayment)) {
                ps.setInt(1, orderId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        paymentId = rs.getInt("payment_id");
                        paymentMethod = rs.getString("payment_method");
                    }
                }
            }

            if (paymentId != -1) {
                if ("ChuyenKhoan".equalsIgnoreCase(paymentMethod) && "DaXacNhan".equals(newStatus)) {
                    String sqlUpdatePayment = "UPDATE Payment SET payment_status = ? WHERE payment_id = ?";
                    try (PreparedStatement ps = con.prepareStatement(sqlUpdatePayment)) {
                        ps.setString(1, "Đã Xác Nhận");
                        ps.setInt(2, paymentId);
                        ps.executeUpdate();
                    }
                } else if ("COD".equalsIgnoreCase(paymentMethod) && "HoanThanh".equals(newStatus)) {
                    String sqlUpdatePayment = "UPDATE Payment SET payment_status = ? , payment_date = GETDATE() WHERE payment_id = ?";
                    try (PreparedStatement ps = con.prepareStatement(sqlUpdatePayment)) {
                        ps.setString(1, "Đã Thanh Toán");
                        ps.setInt(2, paymentId);
                        ps.executeUpdate();
                    }
                } else if ("ChuyenKhoan".equalsIgnoreCase(paymentMethod) && "DaHuy".equals(newStatus)) {
                    String sqlUpdatePayment = "UPDATE Payment SET payment_status = ? WHERE payment_id = ?";
                    try (PreparedStatement ps = con.prepareStatement(sqlUpdatePayment)) {
                        ps.setString(1, "Hoàn Tiền");
                        ps.setInt(2, paymentId);
                        ps.executeUpdate();
                    }
                }
            }

            con.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (con != null)
                    con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        } finally {
            try {
                if (con != null)
                    con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean hasUserPurchasedProduct(int userId, int productId) throws SQLException {
        String sql = "SELECT COUNT(*) AS cnt " +
                "FROM [Order] o " +
                "JOIN OrderDetail od ON o.order_id = od.order_id " +
                "WHERE o.user_id = ? AND od.product_id = ? " +
                "AND o.order_status IN ('HoanThanh')";
        // tùy hệ thống bạn có thể chỉ để 'HoanThanh'

        try (Connection con = this.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("cnt") > 0;
                }
            }
        }
        return false;
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

        Connection con = this.getConnection();
        try (
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
                + "u.username, u.user_email, u.user_fullname, u.user_address, u.user_phone, "
                + "p.payment_id, p.payment_method, p.payment_date, p.payment_amount, p.transaction_id, "
                + "p.payment_status "
                + "FROM [Order] o "
                + "JOIN [User] u ON o.user_id = u.user_id "
                + "LEFT JOIN Payment p ON o.order_id = p.order_id "
                + "ORDER BY o.order_date DESC, o.order_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(query)) {

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

                    // map Payment
                    int paymentId = rs.getInt("payment_id");
                    if (paymentId != 0) { // có payment
                        Payment p = new Payment();
                        p.setPaymentId(paymentId);
                        p.setMethod(rs.getString("payment_method"));
                        p.setDate(rs.getDate("payment_date"));
                        p.setAmount(rs.getBigDecimal("payment_amount"));
                        p.setTransactionId(rs.getString("transaction_id"));
                        p.setStatus(rs.getString("payment_status"));
                        p.setOrderId(o.getOrderId());

                        o.setPayment(p);
                    }

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
                ps.setString(3, "ChoXacNhan");
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

    public int countOrdersByUserId(int userId) {
        String sql = "SELECT COUNT(*) AS total FROM [Order] WHERE user_id = ?";
        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Order> getOrdersByUserIdWithPage(int userId, int page, int pageSize) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "SELECT o.order_id, o.user_id, o.order_price, o.order_status, "
                + "o.order_date, o.voucher_id, "
                + "p.payment_id, p.payment_method, p.payment_date, p.payment_amount, "
                + "p.transaction_id, p.payment_status "
                + "FROM [Order] o "
                + "LEFT JOIN Payment p ON o.order_id = p.order_id "
                + "WHERE o.user_id = ? "
                + "ORDER BY o.order_date DESC, o.order_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            int offset = (page - 1) * pageSize;
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("order_id"));
                    o.setUserId(rs.getInt("user_id"));
                    o.setPrice(rs.getBigDecimal("order_price"));
                    o.setStatus(rs.getString("order_status"));
                    o.setOrderDate(rs.getDate("order_date"));
                    o.setVoucherId(rs.getInt("voucher_id"));

                    int paymentId = rs.getInt("payment_id");
                    if (!rs.wasNull()) {
                        Payment p = new Payment();
                        p.setPaymentId(paymentId);
                        p.setMethod(rs.getString("payment_method"));
                        p.setDate(rs.getDate("payment_date"));
                        p.setAmount(rs.getBigDecimal("payment_amount"));
                        p.setTransactionId(rs.getString("transaction_id"));
                        p.setStatus(rs.getString("payment_status"));
                        o.setPayment(p);
                    }

                    list.add(o);
                }
            }
        }
        return list;
    }

    public Order getOrderById(int orderId) throws SQLException {
        Order o = null;
        String query = "SELECT o.*, u.username, u.user_email, u.user_fullname, u.user_address, u.user_phone, "
                + "p.payment_id, p.payment_method, p.payment_date, p.payment_amount, p.transaction_id, p.payment_status "
                + "FROM [Order] o "
                + "JOIN [User] u ON o.user_id = u.user_id "
                + "LEFT JOIN Payment p ON o.order_id = p.order_id "
                + "WHERE o.order_id = ?";

        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    o = new Order();
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

                    int paymentId = rs.getInt("payment_id");
                    if (!rs.wasNull()) {
                        Payment p = new Payment();
                        p.setPaymentId(paymentId);
                        p.setMethod(rs.getString("payment_method"));
                        p.setDate(rs.getDate("payment_date"));
                        p.setAmount(rs.getBigDecimal("payment_amount"));
                        p.setTransactionId(rs.getString("transaction_id"));
                        p.setStatus(rs.getString("payment_status"));
                        o.setPayment(p);
                    }
                }
            }
        }

        if (o != null) {
            o.setOrderDetails(getOrderDetails(orderId));
        }
        return o;
    }

    public List<OrderDetail> getOrderDetails(int orderId) throws SQLException {
        List<OrderDetail> list = new ArrayList<>();
        String query = "SELECT * FROM OrderDetail WHERE order_id = ?";
        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderDetail od = new OrderDetail();
                    od.setOrderId(rs.getInt("order_id"));
                    od.setProductId(rs.getInt("product_id"));
                    od.setQuantity(rs.getInt("product_quantity"));
                    od.setNameSnapshot(rs.getString("product_name_snapshot"));
                    od.setPriceSnapshot(rs.getBigDecimal("product_price_snapshot"));
                    list.add(od);
                }
            }
        }
        return list;
    }

    public boolean deleteOrder(int orderId) throws SQLException {
        Connection con = null;
        try {
            con = this.getConnection();
            con.setAutoCommit(false);

            // 1. Lấy danh sách OrderDetail để trả stock
            String sqlOrderDetail = "SELECT product_id, product_quantity FROM OrderDetail WHERE order_id = ?";
            List<int[]> productList = new ArrayList<>();

            try (PreparedStatement ps = con.prepareStatement(sqlOrderDetail)) {
                ps.setInt(1, orderId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        productList.add(new int[] { rs.getInt("product_id"), rs.getInt("product_quantity") });
                    }
                }
            }

            // 2. Trả stock cho product
            if (!productList.isEmpty()) {
                String sqlUpdateStock = "UPDATE Product SET product_stock = product_stock + ? WHERE product_id = ?";
                try (PreparedStatement ps = con.prepareStatement(sqlUpdateStock)) {
                    for (int[] p : productList) {
                        ps.setInt(1, p[1]);
                        ps.setInt(2, p[0]);
                        ps.addBatch();
                    }
                    ps.executeBatch();
                }
            }

            // 3. Xóa Payment nếu có (LEFT JOIN nên có thể không có, nhưng xóa nếu tồn tại)
            String sqlDeletePayment = "DELETE FROM Payment WHERE order_id = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlDeletePayment)) {
                ps.setInt(1, orderId);
                ps.executeUpdate();
            }

            // 4. Xóa OrderDetail
            String sqlDeleteDetail = "DELETE FROM OrderDetail WHERE order_id = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlDeleteDetail)) {
                ps.setInt(1, orderId);
                ps.executeUpdate();
            }

            // 5. Xóa Order
            String sqlDeleteOrder = "DELETE FROM [Order] WHERE order_id = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlDeleteOrder)) {
                ps.setInt(1, orderId);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 0) {
                    throw new SQLException("No order found with id: " + orderId);
                }
            }

            con.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}