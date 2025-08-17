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

    //private final String IMAGE_BASE_PATH = "/var/www/phuonganhstore/Images";

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
                try {
                    productDAO.deleteProduct(id);
                    request.getSession().setAttribute("notification", "Xóa sản phẩm thành công!");
                } catch (Exception e) {
                    request.getSession().setAttribute("notification", "Không thể xóa sản phẩm! Có thể sản phẩm đang nằm trong giỏ hàng hoặc đơn hàng.");
                    response.sendRedirect(request.getContextPath() + "/admin/productManagement");
                    return;
                }
                // Lấy sản phẩm để biết đường dẫn ảnh
                Product product = productDAO.getProductById(id);
                if (product != null) {
                    // Xử lý xóa ảnh
                    String imageString = product.getImage(); // ví dụ: "img1.jpg,img2.jpg"
                    String categoryName = product.getCategory().getCategoryName();
                    String categoryTypeName = product.getCategoryType().getCategoryTypeName();

                    if (imageString != null && !imageString.isEmpty()) {
                        String[] imageNames = imageString.split(",");
                        for (String imageName : imageNames) {
                            String subFolder = categoryName + "/" + categoryTypeName;
                            File imageFile = new File(IMAGE_BASE_PATH + "/" + subFolder, imageName);
                            if (imageFile.exists()) {
                                imageFile.delete(); // ❌ Không cần bắt lỗi ở đây
                            }
                        }
                    }
                }
                // Sau khi xóa ảnh → xóa dữ liệu trong DB
                success = true;
            } else if ("add".equals(action)) {
                request.getRequestDispatcher("/WEB-INF/views/admin/add_product.jsp").forward(request, response);

            } else if ("search".equals(action)) {
                String keyword = request.getParameter("keyword");
                List<Product> productList = productDAO.searchProductByKeywords(keyword);
                request.setAttribute("products", productList);
                request.setAttribute("keyword", keyword);
                request.getRequestDispatcher("/WEB-INF/views/admin/new_product_list.jsp").forward(request, response);

            } else if ("viewDetail".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                // Lấy sản phẩm theo ID
                List<String> currentImages = new ArrayList<>();
                Product product = productDAO.getProductById(id);
                // Chia tách chuỗi ảnh thành danh sách
                String oldImageString = product.getImage();
                if (oldImageString != null && !oldImageString.trim().isEmpty()) {
                    currentImages.addAll(Arrays.asList(oldImageString.split(",")));
                }
                request.setAttribute("images", currentImages);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/WEB-INF/views/admin/product_detail.jsp").forward(request, response);

            } else {
                ProductDAO productDAO = new ProductDAO();
                int totalProducts = productDAO.countAll(); // Tổng số sản phẩm
                int productsPerPage = 60;
                int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

                int productCount = productDAO.countAll();
                int currentPage = 1;
                String pageParam = request.getParameter("page");
                if (pageParam != null && pageParam.matches("\\d+")) {
                    currentPage = Integer.parseInt(pageParam);
                }
                // Truyền dữ liệu cho JSP
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", currentPage);
                // Gọi DAO để lấy danh sách tất cả sản phẩm
                List<Product> productList = productDAO.getProductsByPage(currentPage, 60);
                // Đưa danh sách sản phẩm lên request
                request.setAttribute("productCount", productCount);
                request.setAttribute("products", productList);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("totalPages", totalPages);
                // Chuyển hướng đến trang hiển thị sản phẩm
                request.getRequestDispatcher("/WEB-INF/views/admin/new_product_list.jsp").forward(request, response);
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
                product.setType(request.getParameter("type"));
                product.setNote(request.getParameter("note"));
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
                        String subFolder = categoryName + "/" + categoryTypeName;

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
                        // String relativePath = subFolder + "/" + originalFileName;
                        imageNames.add(originalFileName);
                    }
                }

                // Gán tên ảnh vào model
                product.setImage(String.join(",", imageNames));

                // Lưu sản phẩm
                productDAO.addProduct(product);
                request.setAttribute("message", "Thêm sản phẩm thành công!");
                // Chuyển hướng
                request.getRequestDispatcher("/WEB-INF/views/admin/add_product.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(500, "Lỗi khi xử lý sản phẩm: " + e.getMessage());
            }
        } else if ("edit".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("id"));
                Product existingProduct = productDAO.getProductById(productId);

                // Cập nhật thông tin cơ bản
                existingProduct.setName(request.getParameter("name"));
                existingProduct.setPrice(new BigDecimal(request.getParameter("price")));
                existingProduct.setDescription(request.getParameter("description"));
                existingProduct.setBrand(request.getParameter("brand"));
                existingProduct.setStock(Integer.parseInt(request.getParameter("stock")));
                existingProduct.setStatus(Boolean.parseBoolean(request.getParameter("status")));
                existingProduct.setType(request.getParameter("type"));
                existingProduct.setNote(request.getParameter("note"));

                // Lấy category mới
                String categoryName = request.getParameter("categoryName");
                String categoryTypeName = request.getParameter("categoryTypeName");

                int categoryId = productDAO.getCategoryIdByName(categoryName);
                int categoryTypeId = productDAO.getCategoryTypeIdByName(categoryTypeName);

                Category category = new Category();
                category.setCategoryId(categoryId);
                category.setCategoryName(categoryName);
                existingProduct.setCategory(category);

                CategoryType categoryType = new CategoryType();
                categoryType.setCategoryTypeId(categoryTypeId);
                categoryType.setCategoryTypeName(categoryTypeName);
                existingProduct.setCategoryType(categoryType);

                // Tên thư mục mới theo category
                String newSubFolder = categoryName + "/" + categoryTypeName;

                // Lấy thư mục cũ từ form
                String oldSubFolder = request.getParameter("oldSubFolder");

                // Danh sách ảnh hiện tại
                List<String> currentImages = new ArrayList<>();
                String oldImageString = existingProduct.getImage();
                if (oldImageString != null && !oldImageString.trim().isEmpty()) {
                    currentImages.addAll(Arrays.asList(oldImageString.split(",")));
                }

                // Xoá ảnh theo yêu cầu (từ danh sách deletedImages)
                String imageString = request.getParameter("deletedImages");
                if (imageString != null && !imageString.trim().isEmpty()) {
                    Set<String> deletedImages = new HashSet<>(Arrays.asList(imageString.split(",")));
                    currentImages.removeIf(deletedImages::contains);

                    String[] imageNamess = imageString.split(",");
                    for (String imageName : imageNamess) {
                        File imageFile = new File(IMAGE_BASE_PATH + "/" + oldSubFolder, imageName);
                        if (imageFile.exists()) {
                            imageFile.delete();
                        }
                    }
                }

                // Thêm ảnh mới nếu có
                Collection<Part> parts = request.getParts();
                List<String> newImageNames = new ArrayList<>();

                for (Part part : parts) {
                    if (part.getName().startsWith("image") && part.getSize() > 0) {
                        String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                        File saveDir = new File(IMAGE_BASE_PATH, newSubFolder);
                        if (!saveDir.exists()) {
                            saveDir.mkdirs();
                        }

                        File outputFile = new File(saveDir, originalFileName);
                        try (InputStream input = part.getInputStream();
                                FileOutputStream fos = new FileOutputStream(outputFile)) {
                            input.transferTo(fos);
                        }

                        newImageNames.add(originalFileName);
                    }
                }

                if (!newImageNames.isEmpty()) {
                    currentImages.addAll(newImageNames);
                }

                // Di chuyển ảnh nếu đổi thư mục
                if (!oldSubFolder.equals(newSubFolder)) {
                    File oldDir = new File(IMAGE_BASE_PATH, oldSubFolder);
                    File newDir = new File(IMAGE_BASE_PATH, newSubFolder);
                    if (!newDir.exists()) {
                        newDir.mkdirs();
                    }

                    for (String imageName : currentImages) {
                        File oldFile = new File(oldDir, imageName);
                        File newFile = new File(newDir, imageName);
                        if (oldFile.exists()) {
                            oldFile.renameTo(newFile); // Di chuyển ảnh
                        }
                    }
                }

                // Cập nhật danh sách ảnh vào DB
                existingProduct.setImage(String.join(",", currentImages));
                productDAO.updateProduct(existingProduct);

                request.setAttribute("message", "Cập nhật sản phẩm thành công!");
                // Bạn có thể redirect hoặc forward lại trang theo nhu cầu
                // request.getRequestDispatcher("/WEB-INF/views/admin/edit_product.jsp").forward(request,
                // response);

            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(500, "Lỗi khi cập nhật sản phẩm: " + e.getMessage());
            }
        }

    }
}
