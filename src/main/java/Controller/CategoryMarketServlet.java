/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author thien
 */
@WebServlet(name = "CategoryMarketServlet", urlPatterns = { "/list-all-product" })
public class CategoryMarketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();

        // Lấy tổng số sản phẩm để tính số trang
        int totalProducts = productDAO.countAll();
        int productsPerPage = 60;
        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

        // Lấy tổng số sản phẩm để hiển thị
        int productCount = productDAO.countAll();
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && pageParam.matches("\\d+")) {
            currentPage = Integer.parseInt(pageParam);
        }

        // Lấy action từ request
        String action = request.getParameter("action");

        if ("viewDetail".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            List<String> currentImages = new ArrayList<>();
            Product product = null;
            try {
                product = productDAO.getProductById(id);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            String oldImageString = product.getImage();
            if (oldImageString != null && !oldImageString.trim().isEmpty()) {
                currentImages.addAll(Arrays.asList(oldImageString.split(",")));
            }
            // Lấy danh sách sản phẩm ngẫu nhiên để hiển thị
            List<Product> recomList = null;
            try {
                recomList = productDAO.getRandomProducts(10);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("recomList", recomList);
            request.setAttribute("images", currentImages);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/pages/product_detail.jsp").forward(request, response);
        } else if ("search".equals(action)) {
            // Xử lý tìm kiếm sản phẩm theo từ khóa
            String keyword = request.getParameter("keyword");
            List<Product> productList = null;
            try {
                productList = productDAO.searchProductByKeywords(keyword);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("search", "search");
            request.setAttribute("flag", "flag");
            request.setAttribute("allProducts", productList);
            request.setAttribute("productCount", productList.size());
            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
        } else if ("sortByCategoryName".equals(action)) {
            try {
                // Xử lý sắp xếp sản phẩm theo tên danh mục
                String type = request.getParameter("type");
                int categoryId = productDAO.getCategoryIdByName(type);
                List<Product> productList;
                productList = productDAO.getProductsByCategoryId(categoryId);
                request.setAttribute("flag", "flag");
                request.setAttribute("search", "search");
                request.setAttribute("allProducts", productList);
                request.setAttribute("productCount", productList.size());
                request.setAttribute("keyword", type);
                request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if ("sortByCategoryNameAndCategoryTypeName".equals(action)) {
            try {
                // Xử lý sắp xếp sản phẩm theo tên danh mục
                String category = request.getParameter("categoryName");
                String categoryType = request.getParameter("categoryTypeName");

                int categoryTypeId = productDAO.getCategoryTypeIdByName(categoryType);
                int categoryId = productDAO.getCategoryIdByName(category);
                List<Product> productList;
                productList = productDAO.getProductsByCategoryAndCategoryTypeId(categoryId, categoryTypeId);
                request.setAttribute("flag", "flag");
                request.setAttribute("search", "search");
                request.setAttribute("allProducts", productList);
                request.setAttribute("productCount", productList.size());
                request.setAttribute("keyword", category + " - " + categoryType);
                request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if ("sortByPrice".equals(action)) {
            try {
                String priceRange = request.getParameter("filter-price");
                List<Product> products = new ArrayList<>();

                if (priceRange != null && priceRange.contains("-")) {
                    String[] parts = priceRange.split("-");

                    BigDecimal min = new BigDecimal(parts[0]);
                    BigDecimal max = new BigDecimal(parts[1]);
                    products = productDAO.getProductsByPriceRange(min, max);

                } else {
                    // Không chọn hoặc dữ liệu sai → trả về toàn bộ sản phẩm
                    products = productDAO.getAllProducts();
                }
                request.setAttribute("search", "search");
                request.setAttribute("flag", "flag");
                request.setAttribute("productCount", products.size());
                request.setAttribute("keyword", priceRange + " VNĐ");
                request.setAttribute("allProducts", products);
                request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        else if ("sortByBrands".equals(action)) {
            try {
                String[] brands = request.getParameterValues("brand");
                List<Product> productList = new ArrayList<>();

                if (brands != null) {
                    productList = productDAO.getProductsByBrands(Arrays.asList(brands));
                } else {
                    productList = productDAO.getAllProducts();
                }
                request.setAttribute("flag", "flag");
                request.setAttribute("search", "search");
                request.setAttribute("allProducts", productList);
                request.setAttribute("productCount", productList.size());
                request.setAttribute("keyword", String.join(", ", brands));
                request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if ("sortByBrand".equals(action)) {
            try {
                // Xử lý sắp xếp sản phẩm theo tên danh mục
                String brand = request.getParameter("brandName");
                List<Product> productList;
                productList = productDAO.getProductsByBrand(brand);
                request.setAttribute("flag", "flag");
                request.setAttribute("search", "search");
                request.setAttribute("allProducts", productList);
                request.setAttribute("productCount", productList.size());
                request.setAttribute("keyword", brand);
                request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            // Truyền dữ liệu cho JSP
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
            // Gọi DAO để lấy danh sách tất cả sản phẩm
            List<Product> productList = productDAO.getProductsByPage(currentPage, 60);
            // Đưa danh sách sản phẩm lên request
            request.setAttribute("productCount", productCount);
            request.setAttribute("allProducts", productList);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            // Chuyển hướng đến trang hiển thị sản phẩm
            request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
