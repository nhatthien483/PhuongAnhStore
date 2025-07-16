package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.Comment;

public class CommentDAO extends DBContext {
    public List<Comment> getCommentsByProductId(int productId) throws SQLException {
        List<Comment> list = new ArrayList<>();
        String query = "SELECT * FROM Comment WHERE product_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setCommentId(rs.getInt("comment_id"));
                c.setProductId(rs.getInt("product_id"));
                c.setUserId(rs.getInt("user_id"));
                c.setCommentDate(rs.getDate("comment_date"));
                c.setCommentText(rs.getString("comment_text"));
                list.add(c);
            }
        }
        return list;
    }
}
