/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
/**
 *
 * @author thien
 */
@WebServlet(name = "CategoryMarketServlet", urlPatterns = {"/list-all-product"})
public class CategoryMarketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        request.setAttribute("allProducts", productList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        // Chuyển hướng đến trang hiển thị sản phẩm
        request.getRequestDispatcher("pages/category-markert.jsp").forward(request, response);
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
