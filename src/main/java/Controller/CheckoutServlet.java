/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;

import DAO.OrderDAO;
import DAO.PaymentDAO;
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
@WebServlet(name = "CheckoutServlet", urlPatterns = { "/checkout" })
public class CheckoutServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        if ("confirm".equals(action)) {
            try {
                OrderDAO orderDAO = new OrderDAO();
                String transactionId = (String) session.getAttribute("paymentId");
                Integer voucherId = null;
                if (session.getAttribute("voucherId") != null) {
                    voucherId = (Integer) session.getAttribute("voucherId");
                    session.removeAttribute("voucherId");
                }
                int orderId = orderDAO.createOrderFromCart(userId, voucherId);

                Object priceObj = session.getAttribute("totalPrice");
                BigDecimal totalPrice = (BigDecimal) session.getAttribute("totalPriceDiscount");
                long amount = 0;
                if (totalPrice == null) {
                    if (priceObj instanceof java.math.BigDecimal) {
                        amount = ((java.math.BigDecimal) priceObj).longValue();
                    } else if (priceObj instanceof Number) {
                        amount = ((Number) priceObj).longValue();
                    }
                } else {
                    if (totalPrice instanceof java.math.BigDecimal) {
                        amount = ((java.math.BigDecimal) totalPrice).longValue();
                    } else if (totalPrice instanceof Number) {
                        amount = ((Number) totalPrice).longValue();
                    }
                }

                String qrBankingFlag = (String) session.getAttribute("qrBankingFlag");
                String paymentMethod;
                String paymentStatus;
                java.sql.Date paymentDateTime;
                if (qrBankingFlag != null && !qrBankingFlag.isEmpty()) {
                    paymentMethod = "ChuyenKhoan";
                    paymentStatus = "Chờ Xác Nhận";
                    paymentDateTime = null;
                    session.removeAttribute("qrBankingFlag");
                } else {
                    paymentMethod = "COD";
                    paymentStatus = "Chờ Thanh Toán";
                    paymentDateTime = null;
                }
                // Thêm payment vào DB
                PaymentDAO pDAO = new PaymentDAO();
                pDAO.createPayment(orderId, paymentMethod, paymentStatus, transactionId, amount, paymentDateTime);
                response.sendRedirect(request.getContextPath() + "/home");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            request.getRequestDispatcher("pages/checkout.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
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
