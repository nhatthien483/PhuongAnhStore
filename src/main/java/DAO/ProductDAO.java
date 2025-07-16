package DAO;

import DB.DBContext;
import Model.Category;
import Model.CategoryType;
import Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        int productCount = dao.countAll();
        System.out.println("Total products: " + productCount);
    }

    public int countAll() {
        String sql = "SELECT COUNT(*) FROM product";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next())
                return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getProductsByPage(int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, c.category_name, ct.category_type_name\r\n" + //
                "FROM product p\r\n" + //
                "LEFT JOIN Category c ON p.category_id = c.category_id\r\n" + //
                "LEFT JOIN CategoryType ct ON p.category_type_id = ct.category_type_id\r\n" + //
                "ORDER BY p.product_id\r\n" + //
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY\r\n";
        Connection conn = this.getConnection();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setName(rs.getString("product_name"));
                    p.setPrice(rs.getBigDecimal("product_price"));
                    p.setBrand(rs.getString("product_brand"));
                    p.setImage(rs.getString("product_img"));
                    p.setVideo(rs.getString("product_video"));
                    p.setStock(rs.getInt("product_stock"));
                    p.setRestock(rs.getBoolean("product_restock"));
                    p.setDescription(rs.getString("product_description"));
                    p.setNote(rs.getString("product_note"));
                    p.setCreateAt(rs.getTimestamp("product_create_at"));
                    p.setUpdateAt(rs.getTimestamp("product_update_at"));
                    p.setStatus(rs.getBoolean("product_status"));
                    p.setType(rs.getString("product_type"));

                    // Gán danh mục lớn
                    Category category = new Category();
                    category.setCategoryId(rs.getInt("category_id"));
                    category.setCategoryName(rs.getString("category_name"));
                    p.setCategory(category);

                    // Gán danh mục nhỏ
                    CategoryType categoryType = new CategoryType();
                    categoryType.setCategoryTypeId(rs.getInt("category_type_id"));
                    categoryType.setCategoryTypeName(rs.getString("category_type_name"));
                    p.setCategoryType(categoryType);

                    list.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Product> getRandomProducts(int limit) throws SQLException {
        List<Product> list = new ArrayList<>();

        String query = "SELECT TOP (?) p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id " +
                "ORDER BY NEWID()"; // SQL Server: random rows

        try (Connection con = this.getConnection();
                PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Category object
                Category category = new Category(
                        rs.getInt("category_id"),
                        rs.getString("category_name"));

                // CategoryType object
                CategoryType categoryType = new CategoryType(
                        rs.getInt("category_type_id"),
                        rs.getString("category_type_name"));

                // Product object
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getBigDecimal("product_price"));
                p.setBrand(rs.getString("product_brand"));
                p.setImage(rs.getString("product_img"));
                p.setVideo(rs.getString("product_video"));
                p.setStock(rs.getInt("product_stock"));
                p.setRestock(rs.getBoolean("product_restock"));
                p.setDescription(rs.getString("product_description"));
                p.setNote(rs.getString("product_note"));
                p.setCreateAt(rs.getDate("product_create_at"));
                p.setUpdateAt(rs.getDate("product_update_at"));
                p.setStatus(rs.getBoolean("product_status"));
                p.setType(rs.getString("product_type"));
                p.setCategory(category);
                p.setCategoryType(categoryType);

                list.add(p);
            }
        }

        return list;
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> list = new ArrayList<>();

        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("category_id"),
                        rs.getString("category_name"));

                CategoryType categoryType = new CategoryType(
                        rs.getInt("category_type_id"),
                        rs.getString("category_type_name"));

                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getBigDecimal("product_price"));
                p.setBrand(rs.getString("product_brand"));
                p.setImage(rs.getString("product_img"));
                p.setVideo(rs.getString("product_video"));
                p.setStock(rs.getInt("product_stock"));
                p.setRestock(rs.getBoolean("product_restock"));
                p.setDescription(rs.getString("product_description"));
                p.setNote(rs.getString("product_note"));
                p.setCreateAt(rs.getDate("product_create_at"));
                p.setUpdateAt(rs.getDate("product_update_at"));
                p.setStatus(rs.getBoolean("product_status"));
                p.setType(rs.getString("product_type"));
                p.setCategory(category);
                p.setCategoryType(categoryType);

                list.add(p);
            }
        }

        return list;
    }

    public Product getProductById(int id) throws SQLException {
        String query = "SELECT p.*, c.category_type AS category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id " +
                "WHERE p.product_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Category category = new Category(
                        rs.getInt("category_id"),
                        rs.getString("category_name"));

                CategoryType categoryType = new CategoryType(
                        rs.getInt("category_type_id"),
                        rs.getString("category_type_name"));

                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getBigDecimal("product_price"));
                p.setBrand(rs.getString("product_brand"));
                p.setImage(rs.getString("product_img"));
                p.setVideo(rs.getString("product_video"));
                p.setStock(rs.getInt("product_stock"));
                p.setRestock(rs.getBoolean("product_restock"));
                p.setDescription(rs.getString("product_description"));
                p.setNote(rs.getString("product_note"));
                p.setCreateAt(rs.getDate("product_create_at"));
                p.setUpdateAt(rs.getDate("product_update_at"));
                p.setStatus(rs.getBoolean("product_status"));
                p.setType(rs.getString("product_type"));
                p.setCategory(category);
                p.setCategoryType(categoryType);

                return p;
            }
        }
        return null;
    }

    // Các hàm thêm/sửa/xóa dưới đây bạn sẽ cần cập nhật đầy đủ cột, hiện giữ nguyên
    // để ngắn gọn.

    public void updateProduct(Product product) throws SQLException {
        String query = "UPDATE Product SET product_name = ?, product_price = ?, product_description = ? WHERE product_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, product.getName());
            ps.setBigDecimal(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setInt(4, product.getProductId());
            ps.executeUpdate();
        }
    }

    public int getCategoryIdByName(String name) throws SQLException {
        String sql = "SELECT category_id FROM Category WHERE category_name = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
                return rs.getInt("category_id");
        }
        return 0;
    }

    public int getCategoryTypeIdByName(String name) throws SQLException {
        String sql = "SELECT category_type_id FROM CategoryType WHERE category_type_name = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
                return rs.getInt("category_type_id");
        }
        return 0;
    }

    public void addProduct(Product product) throws SQLException {
        String query = "INSERT INTO Product (product_name, product_price, product_description, product_img, " +
                "product_brand, product_stock, product_status, category_id, category_type_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, product.getName());
            ps.setBigDecimal(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getBrand());
            ps.setInt(6, product.getStock());
            ps.setBoolean(7, product.isStatus());
            ps.setInt(8, product.getCategory().getCategoryId());
            ps.setInt(9, product.getCategoryType().getCategoryTypeId());

            ps.executeUpdate();
        }
    }

    public void deleteProduct(int id) throws SQLException {
        String query = "DELETE FROM Product WHERE product_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public List<Product> searchProducts(String keyword) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE product_name LIKE ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                list.add(p);
            }
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(int categoryId) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE category_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                list.add(p);
            }
        }
        return list;
    }

    public List<Product> getProductsByPriceRange(double min, double max) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE product_price BETWEEN ? AND ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setDouble(1, min);
            ps.setDouble(2, max);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                list.add(p);
            }
        }
        return list;
    }

    public List<Product> getProductsByName(String name) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE product_name LIKE ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                list.add(p);
            }
        }
        return list;
    }
}
