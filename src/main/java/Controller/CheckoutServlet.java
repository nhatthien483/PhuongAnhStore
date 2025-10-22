package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.OrderDAO;
import DAO.PaymentDAO;

/**
 * Servlet handling checkout operations
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = { "/checkout" })
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("confirm".equals(action)) {
            // Redirect to checkout page to prevent direct GET confirmation
            response.sendRedirect(request.getContextPath() + "/checkout");
        } else {
            request.getRequestDispatcher("pages/checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("confirm".equals(action)) {
            HttpSession session = request.getSession();
            int userId = (int) session.getAttribute("userId");
            try {
                // Validate paymentMethod
                String paymentMethod = request.getParameter("paymentMethod");
                if (paymentMethod == null || paymentMethod.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Phương thức thanh toán không hợp lệ.");
                    return;
                }

                // Valid combinations
                if (paymentMethod.equals("COD") || 
                    paymentMethod.equals("CK_SHIP") || 
                    paymentMethod.equals("CK_STORE") || 
                    paymentMethod.equals("TM_STORE")) {
                    // Valid
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Phương thức thanh toán và nhận hàng không hợp lệ.");
                    return;
                }

                OrderDAO orderDAO = new OrderDAO();
                Integer voucherId = (Integer) session.getAttribute("voucherId");
                if (voucherId != null) {
                    session.removeAttribute("voucherId");
                }
                // Use existing createOrderFromCart method
                int orderId = orderDAO.createOrderFromCart(userId, voucherId);

                BigDecimal totalPriceDiscount = (BigDecimal) session.getAttribute("totalPriceDiscount");
                BigDecimal totalPrice = (BigDecimal) session.getAttribute("totalPrice");
                long amount = (totalPriceDiscount != null ? totalPriceDiscount : totalPrice).longValue();

                String paymentStatus = paymentMethod.startsWith("CK_") ? "Chờ Xác Nhận" : "Chờ Thanh Toán";
                String transactionId = (String) session.getAttribute("paymentId");
                session.removeAttribute("paymentId");

                PaymentDAO pDAO = new PaymentDAO();
                pDAO.createPayment(orderId, paymentMethod, paymentStatus, transactionId, amount, null);

                response.sendRedirect(request.getContextPath() + "/orders");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles checkout and payment processing for Phuong Anh Store";
    }
}