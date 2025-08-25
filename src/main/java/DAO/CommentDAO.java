package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.Comment;
import Model.Product;
import Model.User;

public class CommentDAO extends DBContext {

    public List<Comment> getCommentsByProductId(int productId) throws SQLException {
        List<Comment> list = new ArrayList<>();
        // Join thêm bảng User để lấy username
        String query = "SELECT c.comment_id, c.product_id, c.user_id, c.comment_date, c.comment_text, u.user_fullname "
                +
                "FROM Comment c " +
                "JOIN [User] u ON c.user_id = u.user_id " +
                "WHERE c.product_id = ? " +
                "ORDER BY c.comment_date DESC"; // có thể thêm order nếu muốn

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
                c.setUserFullname(rs.getString("user_fullname"));
                list.add(c);
            }
        }
        return list;
    }

    public boolean addComment(Comment c) throws SQLException {
        String sql = "INSERT INTO Comment (product_id, user_id, comment_text, comment_date) VALUES (?, ?, ?, GETDATE())";
        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, c.getProductId());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getCommentText());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteComment(int commentId) throws SQLException {
        String sql = "DELETE FROM Comment WHERE comment_id = ?";
        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, commentId);
            return ps.executeUpdate() > 0;
        }
    }

    public List<Comment> getAllComments() throws SQLException {
        List<Comment> list = new ArrayList<>();

        String query = "SELECT c.comment_id, c.comment_date, c.comment_text, " +
                "u.user_id, u.user_fullname, " +
                "p.product_id, p.product_name " +
                "FROM Comment c " +
                "JOIN [User] u ON c.user_id = u.user_id " +
                "JOIN Product p ON c.product_id = p.product_id " +
                "ORDER BY c.comment_date DESC";

        Connection con = this.getConnection();
        try (
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Comment c = new Comment();
                c.setCommentId(rs.getInt("comment_id"));
                c.setCommentDate(rs.getDate("comment_date"));
                c.setCommentText(rs.getString("comment_text"));

                // Gắn User
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("user_fullname"));
                c.setUser(u);

                // Gắn Product
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                c.setProduct(p);

                list.add(c);
            }
        }

        return list;
    }

    // Lấy tất cả comment có phân trang
    public List<Comment> getAllCommentsWithPage(int page, int pageSize) throws SQLException {
        List<Comment> list = new ArrayList<>();

        String query = "SELECT c.comment_id, c.comment_date, c.comment_text, " +
                "u.user_id, u.user_fullname, " +
                "p.product_id, p.product_name " +
                "FROM Comment c " +
                "JOIN [User] u ON c.user_id = u.user_id " +
                "JOIN Product p ON c.product_id = p.product_id " +
                "ORDER BY c.comment_date DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Comment c = new Comment();
                c.setCommentId(rs.getInt("comment_id"));
                c.setCommentDate(rs.getDate("comment_date"));
                c.setCommentText(rs.getString("comment_text"));

                // Gắn User
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("user_fullname"));
                c.setUser(u);

                // Gắn Product
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                c.setProduct(p);

                list.add(c);
            }
        }
        return list;
    }

    // Đếm tổng số comment để tính tổng trang
    public int countAllComments() throws SQLException {
        String sql = "SELECT COUNT(*) FROM Comment";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

}
