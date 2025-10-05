/*
 * CheckVoucherServlet.java
 */
package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;

import DAO.CartDAO;
import DAO.VoucherDAO;
import Model.Cart;
import Model.Voucher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CheckVoucherServlet", urlPatterns = { "/check-voucher" })
public class CheckVoucherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        VoucherDAO voucherDAO = new VoucherDAO();

        try {
            // Ensure user is logged in and has a userId in session
            Object userIdObj = session.getAttribute("userId");
            if (userIdObj == null || !(userIdObj instanceof Integer)) {
                response.getWriter().write("{\"valid\":false, \"message\":\"Vui lòng đăng nhập để sử dụng mã giảm giá\"}");
                return;
            }
            int userId = (Integer) userIdObj;

            CartDAO cDAO = new CartDAO();
            Cart cart = cDAO.getCartByUserId(userId);

            if (cart == null) {
                response.getWriter().write("{\"valid\":false, \"message\":\"Giỏ hàng trống\"}");
                return;
            }

            // Tính subtotal từ CartDetail
            BigDecimal subtotal = cart.getCartPrice();

            // Kiểm tra voucher
            Voucher voucher = voucherDAO.getVoucherByCode(code);
            if (voucher != null && voucher.getQuantity() > 0) {
                // Lấy ngày hôm nay (chỉ phần ngày)
                LocalDate today = LocalDate.now(); // Use dynamic date instead of hardcoded
                LocalDate expiry = voucher.getExpiryDate().toLocalDate();

                // Còn hạn nếu expiry >= today
                if (!expiry.isBefore(today)) {
                    // Set session attributes as in the original code
                    session.setAttribute("voucherId", voucher.getId());
                    BigDecimal discountAmount = subtotal.multiply(
                            BigDecimal.valueOf(voucher.getDiscount()).divide(BigDecimal.valueOf(100)));
                    BigDecimal total = subtotal.subtract(discountAmount);
                    session.setAttribute("totalPriceDiscount", total);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    DecimalFormat df = new DecimalFormat("#.##"); // tối đa 2 chữ số thập phân
                    String discountPercentStr = df.format(voucher.getDiscount());
                    response.getWriter().write(
                            "{"
                                    + "\"valid\":true,"
                                    + "\"discountAmount\":\"" + formatCurrency(discountAmount) + "\","
                                    + "\"discountPercent\":" + discountPercentStr + ","
                                    + "\"totalFormatted\":\"" + formatCurrency(total) + "\""
                                    + "}");
                } else {
                    response.getWriter().write(
                            "{\"valid\":false, \"message\":\"Mã giảm giá đã hết hạn\"}");
                }
            } else {
                response.getWriter().write(
                        "{\"valid\":false, \"message\":\"Mã giảm giá không hợp lệ hoặc đã hết hạn\"}");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý yêu cầu.");
        }
    }

    private String formatCurrency(BigDecimal amount) {
        return java.text.NumberFormat.getInstance(new java.util.Locale("vi", "VN")).format(amount);
    }
}