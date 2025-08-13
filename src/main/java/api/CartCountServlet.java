/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;

import DAO.CartDAO;
import java.io.IOException;
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
@WebServlet("/api/GetCartCountServlet")
public class CartCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // false: không tạo session nếu chưa có
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        int cartCount = 0;
        try {
            if (userId != null) {
                CartDAO cartDAO = new CartDAO();
                Model.Cart cart;
                cart = cartDAO.getCartByUserId(userId);
                cartCount = (cart != null) ? cart.getCartCount() : 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"cartCount\":" + cartCount + "}");
    }
}
