/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.CartDAO;
import Model.Cart;
import Model.CartDetail;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thien
 */
@WebServlet(name = "CartItemServlet", urlPatterns = { "/api/GetCartItemServlet" })
public class CartItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (userId == null) {
            response.getWriter().write("[]");
            return;
        }

        try {
            CartDAO cartDAO = new CartDAO();
            Cart cart = cartDAO.getCartByUserId(userId);
            List<CartDetail> items = cartDAO.getCartDetailByCartId(cart.getCartId());
            JSONArray jsonArray = new JSONArray();

            for (CartDetail c : items) {
                JSONObject obj = new JSONObject();
                Product p = c.getProduct();
                obj.put("productId", p.getProductId());
                obj.put("name", p.getName());
                obj.put("price", p.getPrice());
                obj.put("quantity", c.getQuantity());
                obj.put("image", p.getImage()); // chuỗi ảnh cách nhau bằng dấu phẩy
                obj.put("categoryName", p.getCategory().getCategoryName());
                obj.put("categoryTypeName", p.getCategoryType().getCategoryTypeName());
                jsonArray.put(obj);
            }

            response.getWriter().write(jsonArray.toString()); // ✅ Gửi đúng JSON bạn đã build
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("[]");
        }
    }
}
