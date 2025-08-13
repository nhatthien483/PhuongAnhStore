/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;

import java.io.IOException;
import java.sql.SQLException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import DAO.CartDAO;
import Model.Cart;
import Model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thien
 */
@WebServlet(name = "UpdateCartAPIServlet", urlPatterns = { "/api/updateCart" })
public class UpdateCartAPIServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(request.getReader());

        int productId = jsonNode.get("productId").asInt();
        int quantity = jsonNode.get("quantity").asInt();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        CartDAO cartDAO = new CartDAO();
        try {
            Cart cart = cartDAO.getCartByUserId(user.getUserId());
            cartDAO.updateCartItemQuantity(cart.getCartId(), productId, quantity);
            cartDAO.updateCartSummary(cart.getCartId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
