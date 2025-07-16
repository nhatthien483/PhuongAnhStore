package Controller;

import DAO.ProductDAO;
import Model.Category;
import Model.CategoryType;
import Model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/admin/productManagement")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10, // 10MB mỗi file
        maxRequestSize = 1024 * 1024 * 50 // 50MB tổng
)
public class ProductManagementServlet extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();
    private final String IMAGE_BASE_PATH = "D:/Document/PhuongAnhStore/Images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        boolean success = false;
        try {
            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Product product = productDAO.getProductById(id);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/WEB-INF/views/admin/edit_product.jsp").forward(request, response);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                productDAO.deleteProduct(id);
                success = true;
            } else if ("add".equals(action)) {
                request.getRequestDispatcher("/WEB-INF/views/admin/add_product.jsp").forward(request, response);
            } else {
                List<Product> list = productDAO.getAllProducts();
                request.setAttribute("products", list);
                request.getRequestDispatcher("/WEB-INF/views/admin/product_list.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500);
        }
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/productManagement");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            try {
                Product product = new Product();
                product.setName(request.getParameter("name"));
                product.setPrice(new BigDecimal(request.getParameter("price")));
                product.setDescription(request.getParameter("description"));
                product.setBrand(request.getParameter("brand"));
                product.setStock(Integer.parseInt(request.getParameter("stock")));
                product.setStatus(Boolean.parseBoolean(request.getParameter("status")));

                // Lấy category
                String categoryName = request.getParameter("categoryName");
                String categoryTypeName = request.getParameter("categoryTypeName");

                int categoryId = productDAO.getCategoryIdByName(categoryName);
                int categoryTypeId = productDAO.getCategoryTypeIdByName(categoryTypeName);

                Category category = new Category();
                category.setCategoryId(categoryId);
                category.setCategoryName(categoryName);
                product.setCategory(category);

                CategoryType categoryType = new CategoryType();
                categoryType.setCategoryTypeId(categoryTypeId);
                categoryType.setCategoryTypeName(categoryTypeName);
                product.setCategoryType(categoryType);
                // Xử lý ảnh dạng Blob từ multipart
                Collection<Part> parts = request.getParts();
                List<String> imageNames = new ArrayList<>();

                for (Part part : parts) {
                    if (part.getName().startsWith("image") && part.getSize() > 0) {
                        String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                        // Đường dẫn thư mục con: categoryName/categoryTypeName
                        String subFolder = categoryName.toLowerCase() + "/" + categoryTypeName.toLowerCase();

                        // Tạo thư mục nếu chưa có
                        File saveDir = new File(IMAGE_BASE_PATH, subFolder);
                        if (!saveDir.exists()) {
                            saveDir.mkdirs();
                        }

                        // Gộp thành đường dẫn hoàn chỉnh
                        File outputFile = new File(saveDir, originalFileName);
                        try (InputStream input = part.getInputStream();
                                FileOutputStream fos = new FileOutputStream(outputFile)) {
                            input.transferTo(fos);
                        }

                        // Lưu tên ảnh (relative path) vào danh sách
                        //String relativePath = subFolder + "/" + originalFileName;
                        imageNames.add(originalFileName);
                    }
                }

                // Gán tên ảnh vào model
                product.setImage(String.join(",", imageNames));

                // Lưu sản phẩm
                productDAO.addProduct(product);

                // Chuyển hướng
                response.sendRedirect(request.getContextPath() + "/admin/productManagement");

            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(500, "Lỗi khi xử lý sản phẩm: " + e.getMessage());
            }
        }
    }
}
