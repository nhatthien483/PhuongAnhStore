package DAO;

import DB.DBContext;
import Model.Category;
import Model.CategoryType;
import Model.Product;

import java.io.File;
import java.math.BigDecimal;
import java.sql.*;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ProductDAO extends DBContext {
    // public static void main(String[] args) throws SQLException {
    // ProductDAO dao = new ProductDAO();
    // List<Product> products = dao.getProductsByPriceRange(new
    // BigDecimal("100000"), new BigDecimal("500000"));
    // for (Product p : products) {
    // System.out.println(p.getName());
    // }
    // }

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

    public List<Product> getProductsByPageAdmin(int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, c.category_name, ct.category_type_name\r\n" + //
                "FROM product p\r\n" + //
                "LEFT JOIN Category c ON p.category_id = c.category_id\r\n" + //
                "LEFT JOIN CategoryType ct ON p.category_type_id = ct.category_type_id\r\n" + //
                "ORDER BY p.product_id DESC\r\n" + //
                "\r\n" + //
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
                    String categoryName = rs.getString("category_name");
                    // Gán danh mục nhỏ
                    CategoryType categoryType = new CategoryType();
                    categoryType.setCategoryTypeId(rs.getInt("category_type_id"));
                    categoryType.setCategoryTypeName(rs.getString("category_type_name"));
                    category.setCategoryName(categoryName != null ? categoryName : "N/A");
                    p.setCategoryType(categoryType);

                    list.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Product> getProductsByPage(int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, c.category_name, ct.category_type_name\r\n" + //
                "FROM product p\r\n" + //
                "LEFT JOIN Category c ON p.category_id = c.category_id\r\n" + //
                "LEFT JOIN CategoryType ct ON p.category_type_id = ct.category_type_id\r\n" + //
                "WHERE p.product_status = 1\r\n" + //
                "ORDER BY p.product_id DESC\r\n" + //
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
                    String categoryName = rs.getString("category_name");
                    // Gán danh mục nhỏ
                    CategoryType categoryType = new CategoryType();
                    categoryType.setCategoryTypeId(rs.getInt("category_type_id"));
                    categoryType.setCategoryTypeName(rs.getString("category_type_name"));
                    category.setCategoryName(categoryName != null ? categoryName : "N/A");
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
                "WHERE p.product_status = 1 " +
                "ORDER BY NEWID()";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

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

    public List<Product> getAllProductsAdmin() throws SQLException {
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

    public List<Product> getAllProducts() throws SQLException {
        List<Product> list = new ArrayList<>();

        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id WHERE p.product_status = 1";
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
        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
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

    public void updateProduct(Product product) throws SQLException {
        String query = "UPDATE Product SET product_name = ?, product_price = ?, product_stock = ?, product_description = ?, product_brand = ?, product_status = ?, category_id = ?, category_type_id = ?, product_img = ?, product_note = ?, product_type = ? WHERE product_id = ?";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, product.getName());
            ps.setBigDecimal(2, product.getPrice());
            ps.setInt(3, product.getStock());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getBrand());
            ps.setBoolean(6, product.isStatus());
            ps.setInt(7, product.getCategory().getCategoryId());
            ps.setInt(8, product.getCategoryType().getCategoryTypeId());
            ps.setString(9, product.getImage());
            ps.setString(10, product.getNote());
            ps.setString(11, product.getType());
            ps.setInt(12, product.getProductId());

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
                "product_brand, product_stock, product_status, category_id, category_type_id, product_type, product_note) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            ps.setString(10, product.getType());
            ps.setString(11, product.getNote());
            ps.executeUpdate();
        }
    }

    public void deleteProduct(int id) throws SQLException {
        String selectQuery = "SELECT p.product_img, c.category_name, ct.category_type_name\r\n" + //
                "                    FROM Product p\r\n" + //
                "                    JOIN Category c ON p.category_id = c.category_id\r\n" + //
                "                    JOIN CategoryType ct ON p.category_type_id = ct.category_type_id\r\n" + //
                "                    WHERE p.product_id = ?";

        String deleteQuery = "DELETE FROM Product WHERE product_id = ?";
        Connection con = this.getConnection();

        String imageFilePath = null;

        try (PreparedStatement ps = con.prepareStatement(selectQuery)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String image = rs.getString("product_img");
                    String category = rs.getString("category_name");
                    String categoryType = rs.getString("category_type_name");

                    if (image != null && category != null && categoryType != null) {
                        String categoryFolder = category.replace(" ", "-");
                        String categoryTypeFolder = categoryType.replace(" ", "-");
                        imageFilePath = categoryFolder + "/" + categoryTypeFolder + "/" + image;
                    }
                }
            }
        }

        try (PreparedStatement ps = con.prepareStatement(deleteQuery)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }

        // Xóa ảnh sau khi xóa product
        if (imageFilePath != null) {
            File file = new File("D:/Document/PhuongAnhStore/Images", imageFilePath);
            if (file.exists()) {
                boolean deleted = file.delete();
                if (!deleted) {
                    System.out.println("Không thể xóa ảnh: " + file.getAbsolutePath());
                } else {
                    System.out.println("Đã xóa ảnh: " + file.getAbsolutePath());
                }
            } else {
                System.out.println("Ảnh không tồn tại: " + file.getAbsolutePath());
            }
        }
    }

    public static String removeDiacritics(String input) {
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        return normalized.replaceAll("\\p{InCombiningDiacriticalMarks}+", "")
                .toLowerCase(); // không phân biệt hoa thường
    }

    public List<Product> getProductsByCategoryId(int categoryId) throws SQLException {
        List<Product> list = new ArrayList<>();

        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id WHERE p.category_id = ? AND p.product_status = 1";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
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

    public List<Product> getProductsByPriceRange(double min, double max) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id " +
                "WHERE product_price BETWEEN ? AND ? AND p.product_status = 1";
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

    public static List<String> processSearchKeywords(String keyword) {
        String normalized = Normalizer.normalize(keyword, Normalizer.Form.NFD)
                .replaceAll("\\p{InCombiningDiacriticalMarks}+", "")
                .toLowerCase();

        String[] words = normalized.split("\\s+");
        return Arrays.asList(words);
    }

    public List<Product> searchProductByKeywordsAdmin(String keyword) throws SQLException {
        List<Product> allProducts = getAllProductsAdmin(); // hoặc cache nếu nhiều
        List<String> keywords = processSearchKeywords(keyword);
        List<Product> result = new ArrayList<>();

        for (Product p : allProducts) {
            String nameNormalized = removeDiacritics(p.getName());

            boolean match = true;
            for (String k : keywords) {
                if (!nameNormalized.contains(k)) {
                    match = false;
                    break;
                }
            }
            if (match)
                result.add(p);
        }
        return result;
    }

    public List<Product> searchProductByKeywords(String keyword) throws SQLException {
        List<Product> allProducts = getAllProducts(); // hoặc cache nếu nhiều
        List<String> keywords = processSearchKeywords(keyword);
        List<Product> result = new ArrayList<>();

        for (Product p : allProducts) {
            String nameNormalized = removeDiacritics(p.getName());

            boolean match = true;
            for (String k : keywords) {
                if (!nameNormalized.contains(k)) {
                    match = false;
                    break;
                }
            }
            if (match)
                result.add(p);
        }
        return result;
    }

    public List<Product> getProductsByCategoryAndCategoryTypeId(int categoryId, int category_type_id)
            throws SQLException {
        List<Product> list = new ArrayList<>();

        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id WHERE p.category_id = ? AND p.category_type_id = ? AND p.product_status = 1";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            ps.setInt(2, category_type_id);

            ResultSet rs = ps.executeQuery();
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

    public List<Product> getProductsByBrand(String brand) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id " +
                "WHERE p.product_brand = ? AND p.product_status = 1";
        Connection con = this.getConnection();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, brand);
            ResultSet rs = ps.executeQuery();

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

    public List<Product> getProductsByPriceRange(BigDecimal min, BigDecimal max) throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, c.category_name, ct.category_type_name FROM Product p JOIN Category c ON p.category_id = c.category_id JOIN CategoryType ct ON p.category_type_id = ct.category_type_id  WHERE product_price BETWEEN ? AND ? WHERE p.product_status = 1";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBigDecimal(1, min);
            ps.setBigDecimal(2, max);
            ResultSet rs = ps.executeQuery();
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

    public List<Product> getProductsByBrands(List<String> brands) throws SQLException {
        List<Product> list = new ArrayList<>();

        if (brands == null || brands.isEmpty()) {
            return list; // Trả về rỗng nếu không có brand
        }

        // Tạo chuỗi dấu hỏi (?, ?, ?, ...) tương ứng với số brand
        String placeholders = String.join(",", Collections.nCopies(brands.size(), "?"));

        String query = "SELECT p.*, c.category_name, ct.category_type_name " +
                "FROM Product p " +
                "JOIN Category c ON p.category_id = c.category_id " +
                "JOIN CategoryType ct ON p.category_type_id = ct.category_type_id " +
                "WHERE p.product_brand IN (" + placeholders + ") AND p.product_status = 1";
        try (Connection con = this.getConnection();
                PreparedStatement ps = con.prepareStatement(query)) {

            // Set từng giá trị vào dấu ?
            for (int i = 0; i < brands.size(); i++) {
                ps.setString(i + 1, brands.get(i));
            }

            ResultSet rs = ps.executeQuery();

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

    public List<Product> getProductsByName(String name) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE product_name LIKE ? AND product_status = 1";
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
