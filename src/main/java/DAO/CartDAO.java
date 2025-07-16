package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBContext;
import Model.Cart;

public class CartDAO extends DBContext {
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
