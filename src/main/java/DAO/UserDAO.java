package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.User;
import Service.HashUtil;

public class UserDAO extends DBContext {
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        User user = new User("sonaiper123", "thientom483@gmail.com", "1234", "Nguyễn Huỳnh Nhât Thiện", 1);
        userDAO.register(user);
        System.out.println("User registered successfully!");
    }

    public void clearResetToken(String token) {
        String sql = "DELETE FROM password_reset_token WHERE token = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, token);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatePassword(int userId, String hashedPassword) {
        String sql = "UPDATE [User] SET user_password = ? WHERE user_id = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, hashedPassword);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE user_email = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getUserIdByResetToken(String token) {
        String sql = "SELECT user_id FROM password_reset_token WHERE token = ? AND expires_at > GETDATE()";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, token);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("user_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1; // Không tìm thấy hoặc token hết hạn
    }

    public User getUserById(int id) throws SQLException {
        String query = "SELECT * FROM [User] WHERE user_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("user_email"));
                u.setPassword(rs.getString("user_password"));
                u.setFullName(rs.getString("user_fullname"));
                u.setPhone(rs.getString("user_phone"));
                u.setAddress(rs.getString("user_address"));
                u.setStatus(rs.getString("user_status"));
                u.setCreateAt(rs.getDate("create_at"));
                u.setRoleId(rs.getInt("role_id"));
                return u;
            }
        }
        return null;
    }

    public List<User> getAllUsers() throws SQLException {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM [User]";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("user_email"));
                u.setPassword(rs.getString("user_password"));
                u.setFullName(rs.getString("user_fullname"));
                u.setPhone(rs.getString("user_phone"));
                u.setAddress(rs.getString("user_address"));
                u.setStatus(rs.getString("user_status"));
                u.setCreateAt(rs.getDate("create_at"));
                u.setRoleId(rs.getInt("role_id"));
                list.add(u);
            }
        }
        return list;
    }

    public void saveResetToken(int userId, String token) {
        String sql = "MERGE INTO password_reset_token AS target " +
                "USING (SELECT ? AS user_id, ? AS token, DATEADD(MINUTE, 30, GETDATE()) AS expires_at) AS source " +
                "ON target.user_id = source.user_id " +
                "WHEN MATCHED THEN UPDATE SET token = source.token, expires_at = source.expires_at " +
                "WHEN NOT MATCHED THEN INSERT (user_id, token, expires_at) VALUES (source.user_id, source.token, source.expires_at);";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, token);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User login(String username, String password) {
        String sql = "SELECT * FROM [User] WHERE username = ? AND user_password = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, HashUtil.toMD5(password));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkEmailExists(String email) {
        String sql = "SELECT user_id FROM [User] WHERE user_email = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkUsernameExists(String username) {
        String sql = "SELECT user_id FROM [User] WHERE username = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertPendingUser(User user, String token) throws SQLException {
        String sql = "INSERT INTO email_verification (token, username, user_email, user_password, user_fullname, user_phone, user_address, user_status, role_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, token);
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword()); // nên băm trước
            ps.setString(5, user.getFullName());
            ps.setString(6, user.getPhone());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getStatus());
            ps.setInt(9, user.getRoleId());
            ps.executeUpdate();
        }
    }

    public User getPendingUserByToken(String token) throws SQLException {
        String sql = "SELECT * FROM email_verification WHERE token = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("user_email"));
                user.setPassword(rs.getString("user_password"));
                user.setFullName(rs.getString("user_fullname"));
                user.setPhone(rs.getString("user_phone"));
                user.setAddress(rs.getString("user_address"));
                user.setStatus(rs.getString("user_status"));
                user.setRoleId(rs.getInt("role_id"));
                return user;
            }
            return null;
        }
    }

    public void confirmUserRegistration(User user, String token) throws SQLException {
        String insert = "INSERT INTO [User] (username, user_email, user_password, user_fullname, user_phone, user_address, user_status, create_at, role_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE(), ?)";
        String delete = "DELETE FROM email_verification WHERE token = ?";

        try (Connection conn = this.getConnection()) {
            conn.setAutoCommit(false);
            try (PreparedStatement psInsert = conn.prepareStatement(insert);
                    PreparedStatement psDelete = conn.prepareStatement(delete)) {

                psInsert.setString(1, user.getUsername());
                psInsert.setString(2, user.getEmail());
                psInsert.setString(3, user.getPassword());
                psInsert.setString(4, user.getFullName());
                psInsert.setString(5, user.getPhone());
                psInsert.setString(6, user.getAddress());
                psInsert.setString(7, user.getStatus());
                psInsert.setInt(8, user.getRoleId());
                psInsert.executeUpdate();

                psDelete.setString(1, token);
                psDelete.executeUpdate();

                conn.commit();
            } catch (Exception e) {
                conn.rollback();
                throw e;
            }
        }
    }

    public void register(User user) {
        String sql = "INSERT INTO [User] (username, user_email, user_password, user_fullname, user_phone, user_address, user_status, create_at, role_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE(), ?)";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, HashUtil.toMD5(user.getPassword()));
            ps.setString(4, user.getFullName());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getStatus());
            ps.setInt(8, user.getRoleId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setEmail(rs.getString("user_email"));
        user.setPassword(rs.getString("user_password"));
        user.setFullName(rs.getString("user_fullname"));
        user.setPhone(rs.getString("user_phone"));
        user.setAddress(rs.getString("user_address"));
        user.setStatus(rs.getString("user_status"));
        user.setCreateAt(rs.getDate("create_at"));
        user.setRoleId(rs.getInt("role_id"));
        return user;
    }

    // Thêm hàm reset password, check email nếu cần
    public void resetPassword(int userId, String newPassword) throws SQLException {
        String query = "UPDATE [User] SET user_password = ? WHERE user_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }
}
