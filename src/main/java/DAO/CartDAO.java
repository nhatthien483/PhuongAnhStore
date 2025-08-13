package DAO;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.Cart;
import Model.CartDetail;
import Model.Category;
import Model.CategoryType;
import Model.Product;

public class CartDAO extends DBContext {
    public static void main(String[] args) throws SQLException {
        CartDAO cDAO = new CartDAO();
        boolean success = cDAO.addToCart(16, 473, 5);
        if (success) {
            System.out.println("Successfull");
        } else {
            System.out.println("Error");
        }
    }

    public void updateCartItemQuantity(int cartId, int productId, int quantity) throws SQLException {
        String sql = "UPDATE CartDetail SET quantity = ? WHERE cart_id = ? AND product_id = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, cartId);
            stmt.setInt(3, productId);
            stmt.executeUpdate();
        }
    }

    public boolean removeCartItem(int userId, int productId) {
        String getCartSql = "SELECT cart_id FROM Cart WHERE user_id = ?";
        String deleteDetailSql = "DELETE FROM CartDetail WHERE cart_id = ? AND product_id = ?";
        String getTotalQuantitySql = "SELECT SUM(quantity) AS total_quantity FROM CartDetail WHERE cart_id = ?";
        String getTotalPriceSql = "SELECT SUM(cd.quantity * p.product_price) AS total_price FROM CartDetail cd JOIN Product p ON cd.product_id = p.product_id WHERE cd.cart_id = ?";
        String updateCartSql = "UPDATE Cart SET cart_count = ?, cart_price = ? WHERE cart_id = ?";
        Connection conn = this.getConnection();

        try {
            conn.setAutoCommit(false);

            int cartId = -1;

            // 1. Lấy cart_id theo user_id
            try (PreparedStatement stmt = conn.prepareStatement(getCartSql)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    cartId = rs.getInt("cart_id");
                } else {
                    conn.rollback();
                    return false; // Không có cart
                }
            }

            // 2. Xóa sản phẩm khỏi CartDetail
            try (PreparedStatement stmt = conn.prepareStatement(deleteDetailSql)) {
                stmt.setInt(1, cartId);
                stmt.setInt(2, productId);
                stmt.executeUpdate();
            }

            // 3. Tính lại tổng số lượng
            int totalQuantity = 0;
            try (PreparedStatement stmt = conn.prepareStatement(getTotalQuantitySql)) {
                stmt.setInt(1, cartId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    totalQuantity = rs.getInt("total_quantity");
                }
            }

            // 4. Tính lại tổng giá
            BigDecimal totalPrice = BigDecimal.ZERO;
            try (PreparedStatement stmt = conn.prepareStatement(getTotalPriceSql)) {
                stmt.setInt(1, cartId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    totalPrice = rs.getBigDecimal("total_price");
                    if (totalPrice == null)
                        totalPrice = BigDecimal.ZERO;
                }
            }

            // 5. Cập nhật bảng Cart
            try (PreparedStatement stmt = conn.prepareStatement(updateCartSql)) {
                stmt.setInt(1, totalQuantity);
                stmt.setBigDecimal(2, totalPrice);
                stmt.setInt(3, cartId);
                stmt.executeUpdate();
            }

            conn.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    public Cart getCartByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM Cart WHERE user_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Cart c = new Cart();
                c.setCartId(rs.getInt("cart_id"));
                c.setUserId(rs.getInt("user_id"));
                c.setCartPrice(rs.getBigDecimal("cart_price"));
                c.setCartCount(rs.getInt("cart_count"));
                return c;
            }
        }
        return null;
    }

    public List<CartDetail> getCartDetailByCartId(int cartId) {
        List<CartDetail> cartDetails = new ArrayList<>();
        String sql = "SELECT cd.cart_id, cd.product_id, cd.quantity, " +
                "p.product_id, p.product_name, p.product_price, p.product_brand, p.product_img, p.product_video, " +
                "p.product_stock, p.product_restock, p.product_description, p.product_note, p.product_create_at, " +
                "p.product_update_at, p.product_status, p.product_type, " +
                "c.category_id, c.category_name, " +
                "ct.category_type_id, ct.category_type_name " +
                "FROM CartDetail cd " +
                "JOIN Product p ON cd.product_id = p.product_id " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id " +
                "WHERE cd.cart_id = ?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // Tạo Product
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setPrice(rs.getBigDecimal("product_price"));
                product.setBrand(rs.getString("product_brand"));
                product.setImage(rs.getString("product_img"));
                product.setVideo(rs.getString("product_video"));
                product.setStock(rs.getInt("product_stock"));
                product.setRestock(rs.getBoolean("product_restock"));
                product.setDescription(rs.getString("product_description"));
                product.setNote(rs.getString("product_note"));
                product.setCreateAt(rs.getTimestamp("product_create_at"));
                product.setUpdateAt(rs.getTimestamp("product_update_at"));
                product.setStatus(rs.getBoolean("product_status"));
                product.setType(rs.getString("product_type"));

                // Tạo Category
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                product.setCategory(category);

                // Tạo CategoryType
                CategoryType categoryType = new CategoryType();
                categoryType.setCategoryTypeId(rs.getInt("category_type_id"));
                categoryType.setCategoryTypeName(rs.getString("category_type_name"));
                product.setCategoryType(categoryType);

                // Tạo CartDetail
                CartDetail detail = new CartDetail();
                detail.setCartId(rs.getInt("cart_id"));
                detail.setProductId(rs.getInt("product_id"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setProduct(product); // Gán product đầy đủ

                cartDetails.add(detail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartDetails;
    }

    public int getCartItemCount(int cartId) {
        String sql = "SELECT SUM(quantity) AS total_quantity FROM CartDetail WHERE cart_id = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total_quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public BigDecimal getCartTotalPrice(int cartId) {
        String sql = "SELECT SUM(cd.quantity * p.product_price) AS total_price\r\n" + //
                "                    FROM CartDetail cd\r\n" + //
                "                    JOIN Product p ON cd.product_id = p.product_id\r\n" + //
                "                    WHERE cd.cart_id = ?";

        Connection conn = this.getConnection();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getBigDecimal("total_price") != null ? rs.getBigDecimal("total_price") : BigDecimal.ZERO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return BigDecimal.ZERO;
    }

    public void updateCartSummary(int cartId) throws SQLException {
        String sql = " UPDATE Cart\r\n" + //
                "                    SET cart_count = (\r\n" + //
                "                        SELECT SUM(quantity) FROM CartDetail WHERE cart_id = ?\r\n" + //
                "                    ),\r\n" + //
                "                    cart_price = (\r\n" + //
                "                        SELECT SUM(p.product_price * cd.quantity)\r\n" + //
                "                        FROM CartDetail cd\r\n" + //
                "                        JOIN Product p ON cd.product_id = p.product_id\r\n" + //
                "                        WHERE cd.cart_id = ?\r\n" + //
                "                    )\r\n" + //
                "                    WHERE cart_id = ?";

        Connection conn = this.getConnection();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.setInt(2, cartId);
            stmt.setInt(3, cartId);
            stmt.executeUpdate();
        }
    }

    public boolean addToCart(int userId, int productId, int quantity) {
        String getCartSql = "SELECT cart_id FROM Cart WHERE user_id = ?";
        String createCartSql = "INSERT INTO Cart (user_id, cart_price, cart_count) OUTPUT INSERTED.cart_id VALUES (?, 0, 0)";
        String checkCartDetailSql = "SELECT quantity FROM CartDetail WHERE cart_id = ? AND product_id = ?";
        String insertCartDetailSql = "INSERT INTO CartDetail (cart_id, product_id, quantity) VALUES (?, ?, ?)";
        String updateCartDetailSql = "UPDATE CartDetail SET quantity = quantity + 1 WHERE cart_id = ? AND product_id = ?";
        String getTotalQuantitySql = "SELECT SUM(quantity) AS total_quantity FROM CartDetail WHERE cart_id = ?";
        String getTotalPriceSql = "SELECT SUM(cd.quantity * p.product_price) AS total_price FROM CartDetail cd JOIN Product p ON cd.product_id = p.product_id WHERE cd.cart_id = ?";
        String updateCartSql = "UPDATE Cart SET cart_count = ?, cart_price = ? WHERE cart_id = ?";
        Connection conn = this.getConnection();
        try {
            conn.setAutoCommit(false); // Bắt đầu transaction

            int cartId = -1;

            // 1. Tìm cart_id theo user_id
            try (PreparedStatement stmt = conn.prepareStatement(getCartSql)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    cartId = rs.getInt("cart_id");
                }
            }

            // 2. Nếu chưa có cart thì tạo mới
            if (cartId == -1) {
                try (PreparedStatement stmt = conn.prepareStatement(createCartSql)) {
                    stmt.setInt(1, userId);
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        cartId = rs.getInt(1);
                    } else {
                        conn.rollback();
                        return false;
                    }
                }
            }

            // 3. Kiểm tra xem product đã có trong CartDetail chưa
            boolean productExists = false;
            try (PreparedStatement stmt = conn.prepareStatement(checkCartDetailSql)) {
                stmt.setInt(1, cartId);
                stmt.setInt(2, productId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    productExists = true;
                }
            }

            // 4. Thêm mới hoặc cập nhật sản phẩm
            if (productExists) {
                try (PreparedStatement stmt = conn.prepareStatement(updateCartDetailSql)) {
                    stmt.setInt(1, cartId);
                    stmt.setInt(2, productId);
                    stmt.executeUpdate();
                }
            } else {
                try (PreparedStatement stmt = conn.prepareStatement(insertCartDetailSql)) {
                    stmt.setInt(1, cartId);
                    stmt.setInt(2, productId);
                    stmt.setInt(3, quantity);
                    stmt.executeUpdate();
                }
            }

            // 5. Tính tổng số lượng (cart_count)
            int totalQuantity = 0;
            try (PreparedStatement stmt = conn.prepareStatement(getTotalQuantitySql)) {
                stmt.setInt(1, cartId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    totalQuantity = rs.getInt("total_quantity");
                }
            }

            // 6. Tính tổng giá tiền (cart_price)
            BigDecimal totalPrice = BigDecimal.ZERO;
            try (PreparedStatement stmt = conn.prepareStatement(getTotalPriceSql)) {
                stmt.setInt(1, cartId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    totalPrice = rs.getBigDecimal("total_price");
                    if (totalPrice == null)
                        totalPrice = BigDecimal.ZERO;
                }
            }

            // 7. Cập nhật Cart (cart_count và cart_price)
            try (PreparedStatement stmt = conn.prepareStatement(updateCartSql)) {
                stmt.setInt(1, totalQuantity);
                stmt.setBigDecimal(2, totalPrice);
                stmt.setInt(3, cartId);
                stmt.executeUpdate();
            }

            conn.commit(); // Xác nhận thành công
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateCart(Cart cart) throws SQLException {
        String query = "UPDATE Cart SET cart_price = ?, cart_count = ? WHERE cart_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setBigDecimal(1, cart.getCartPrice());
            ps.setInt(2, cart.getCartCount());
            ps.setInt(3, cart.getCartId());
            ps.executeUpdate();
        }
    }
}
