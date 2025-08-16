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
        String sql = "INSERT INTO voucher (code, discount, quantity, expiry_date) VALUES (?, ?, ?, ?)";
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
        String sql = "UPDATE voucher SET code = ?, discount = ?, quantity = ?, expiry_date = ? WHERE id = ?";
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
        String sql = "DELETE FROM voucher WHERE id = ?";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public Voucher getVoucherById(int id) throws SQLException {
        String sql = "SELECT * FROM voucher WHERE id = ?";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Voucher voucher = new Voucher();
                    voucher.setId(rs.getInt("id"));
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
        String sql = "SELECT * FROM voucher";
        Connection conn = this.getConnection();
        try (
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Voucher voucher = new Voucher();
                voucher.setId(rs.getInt("id"));
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

}