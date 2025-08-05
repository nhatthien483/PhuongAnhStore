/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CartDAO;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thien
 */
@WebServlet("/GetCartPriceServlet")
public class CartPriceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // false: không tạo session nếu chưa có
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        BigDecimal cartPrice = BigDecimal.ZERO;

        if (userId != null) {
            try {
                CartDAO cartDAO = new CartDAO();
                Model.Cart cart = cartDAO.getCartByUserId(userId);
                if (cart != null && cart.getCartPrice() != null) {
                    cartPrice = cart.getCartPrice();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\":\"Lỗi khi truy vấn dữ liệu giỏ hàng\"}");
                return;
            }
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"cartPrice\":" + cartPrice + "}");
    }
}
