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
    public Voucher getVoucherById(int id) throws SQLException {
        String query = "SELECT * FROM Voucher WHERE voucher_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Voucher v = new Voucher();
                v.setVoucherId(rs.getInt("voucher_id"));
                v.setVoucherText(rs.getString("voucher_text"));
                return v;
            }
        }
        return null;
    }
    public void addVoucher(Voucher voucher) throws SQLException {
        String query = "INSERT INTO Voucher (voucher_text) VALUES (?)";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, voucher.getVoucherText());
            ps.executeUpdate();
        }
    }

    public List<Voucher> getAllVouchers() throws SQLException {
        List<Voucher> list = new ArrayList<>();
        String query = "SELECT * FROM Voucher";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVoucherId(rs.getInt("voucher_id"));
                v.setVoucherText(rs.getString("voucher_text"));
                list.add(v);
            }
        }
        return list;
    }
}
