package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.CartDetail;

public class CartDetailDAO extends DBContext {
    public List<CartDetail> getCartDetailsByCartId(int cartId) throws SQLException {
        List<CartDetail> list = new ArrayList<>();
        String query = "SELECT * FROM CartDetail WHERE cart_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, cartId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDetail cd = new CartDetail();
                cd.setCartId(rs.getInt("cart_id"));
                cd.setProductId(rs.getInt("product_id"));
                cd.setQuantity(rs.getInt("quantity"));
                list.add(cd);
            }
        }
        return list;
    }

    public void addCartDetail(CartDetail cd) throws SQLException {
        String query = "INSERT INTO CartDetail (cart_id, product_id, quantity) VALUES (?, ?, ?)";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, cd.getCartId());
            ps.setInt(2, cd.getProductId());
            ps.setInt(3, cd.getQuantity());
            ps.executeUpdate();
        }
    }
}
