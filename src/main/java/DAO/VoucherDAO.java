package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBContext;
import Model.Voucher;

public class VoucherDAO extends DBContext {
    public static void main(String[] args) throws SQLException {
        VoucherDAO vDAO = new VoucherDAO();
        Voucher voucher = vDAO.getVoucherByCode("DISCOUNT10");
        System.out.println(voucher.getId());
    }

    public void addVoucher(Voucher voucher) throws SQLException {
        String sql = "INSERT INTO Voucher (code, discount, quantity, expiry_date) VALUES (?, ?, ?, ?)";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, voucher.getCode());
            ps.setDouble(2, voucher.getDiscount());
            ps.setInt(3, voucher.getQuantity());
            ps.setDate(4, voucher.getExpiryDate());
            ps.executeUpdate();
        }
    }

    public void updateVoucher(Voucher voucher) throws SQLException {
        String sql = "UPDATE Voucher SET code = ?, discount = ?, quantity = ?, expiry_date = ? WHERE voucher_id = ?";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, voucher.getCode());
            ps.setDouble(2, voucher.getDiscount());
            ps.setInt(3, voucher.getQuantity());
            ps.setDate(4, voucher.getExpiryDate());
            ps.setInt(5, voucher.getId());
            ps.executeUpdate();
        }
    }

    public void deleteVoucher(int id) throws SQLException {
        String sql = "DELETE FROM Voucher WHERE voucher_id = ?";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public Voucher getVoucherById(int id) throws SQLException {
        String sql = "SELECT * FROM Voucher WHERE voucher_id = ?";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Voucher voucher = new Voucher();
                    voucher.setId(rs.getInt("voucher_id"));
                    voucher.setCode(rs.getString("code"));
                    voucher.setDiscount(rs.getDouble("discount"));
                    voucher.setQuantity(rs.getInt("quantity"));
                    voucher.setExpiryDate(rs.getDate("expiry_date"));
                    return voucher;
                }
            }
        }
        return null;
    }

    public List<Voucher> getAllVouchers() throws SQLException {
        List<Voucher> vouchers = new ArrayList<>();
        String sql = "SELECT * FROM Voucher";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Voucher voucher = new Voucher();
                voucher.setId(rs.getInt("voucher_id"));
                voucher.setCode(rs.getString("code"));
                voucher.setDiscount(rs.getDouble("discount"));
                voucher.setQuantity(rs.getInt("quantity"));
                voucher.setExpiryDate(rs.getDate("expiry_date"));
                vouchers.add(voucher);
            }
        }
        return vouchers;
    }

    public Voucher getVoucherByCode(String code) throws SQLException {
        String sql = "SELECT * FROM Voucher WHERE code = ?";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Voucher voucher = new Voucher();
                voucher.setId(rs.getInt("voucher_id")); // Đúng tên cột trong DB
                voucher.setCode(rs.getString("code"));
                voucher.setDiscount(rs.getDouble("discount"));
                voucher.setQuantity(rs.getInt("quantity"));
                voucher.setExpiryDate(rs.getDate("expiry_date")); // Đúng tên cột
                return voucher;
            }
        }
        return null;
    }

    public List<Voucher> getVouchersByPage(int page, int pageSize) throws SQLException {
        List<Voucher> vouchers = new ArrayList<>();
        String sql = "SELECT * FROM Voucher ORDER BY voucher_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Voucher voucher = new Voucher();
                    voucher.setId(rs.getInt("voucher_id"));
                    voucher.setCode(rs.getString("code"));
                    voucher.setDiscount(rs.getDouble("discount"));
                    voucher.setQuantity(rs.getInt("quantity"));
                    voucher.setExpiryDate(rs.getDate("expiry_date"));
                    vouchers.add(voucher);
                }
            }
        }
        return vouchers;
    }

    public int countAll() throws SQLException {
        String sql = "SELECT COUNT(*) FROM Voucher";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

}