/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import DAO.CartDAO;
import Model.Cart;
import Model.User;
import jakarta.servlet.annotation.WebServlet;
import java.math.BigDecimal;
import java.sql.SQLException;

/**
 *
 * @author thien
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt
 * to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to
 * edit this template
 * /**
 *
 * @author ALIENWARE
 */
@WebServlet("/api/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String partIdStr = request.getParameter("id");
        int quantity = 1;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e) {
            quantity = 1; // fallback nếu không gửi quantity hoặc lỗi định dạng
        }

        if (partIdStr == null || !partIdStr.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product id incorrect.");
            return;
        }
        int partId = Integer.parseInt(partIdStr);
        CartDAO cartDAO = new CartDAO();

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            // Chuyển hướng về trang đăng nhập
            return;
        }
        int userId = user.getUserId();
        try {
            // Đã login → xử lý giỏ hàng DB
            boolean success = cartDAO.addToCart(userId, partId, quantity);
            if (success) {
                CartDAO cDAO = new CartDAO();
                int cartCount = 0;
                Cart cart;
                cart = cDAO.getCartByUserId(userId);
                cartCount = cart.getCartCount();
                BigDecimal totalPrice = cart.getCartPrice();
                session.setAttribute("totalPrice", totalPrice);
                response.getWriter().print(
                        "{\"status\":\"success\", \"cartCount\":" + cartCount + ", \"totalPrice\":" + totalPrice + "}");
            } else {
                response.getWriter().print("{\"status\":\"out_of_stock\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
