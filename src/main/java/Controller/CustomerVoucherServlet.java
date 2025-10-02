package Controller;

import java.io.IOException;
import java.math.BigDecimal;
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

@WebServlet(name = "CustomerVoucherServlet", urlPatterns = { "/voucherCustomer" })
public class CustomerVoucherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        VoucherDAO voucherDAO = new VoucherDAO();

        try {
            if ("check".equals(action)) {
                String code = request.getParameter("code");
                Integer userId = (Integer) session.getAttribute("userId");

                if (userId == null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"valid\":false, \"message\":\"Bạn cần đăng nhập để sử dụng mã giảm giá\"}");
                    return;
                }

                CartDAO cDAO = new CartDAO();
                Cart cart = cDAO.getCartByUserId(userId);

                if (cart == null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"valid\":false, \"message\":\"Giỏ hàng trống\"}");
                    return;
                }

                BigDecimal subtotal = cart.getCartPrice();
                Voucher voucher = voucherDAO.getVoucherByCode(code);

                if (voucher != null && voucher.getQuantity() > 0) {
                    LocalDate today = LocalDate.now(); // lấy ngày hiện tại
                    LocalDate expiry = voucher.getExpiryDate().toLocalDate();

                    if (!expiry.isBefore(today)) {
                        session.setAttribute("voucherId", voucher.getId());
                        BigDecimal discountAmount = subtotal.multiply(
                                BigDecimal.valueOf(voucher.getDiscount()).divide(BigDecimal.valueOf(100)));
                        BigDecimal total = subtotal.subtract(discountAmount);

                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        DecimalFormat df = new DecimalFormat("#.##");
                        String discountPercentStr = df.format(voucher.getDiscount());
                        session.setAttribute("totalPriceDiscount", total);

                        response.getWriter().write(
                                "{"
                                        + "\"valid\":true,"
                                        + "\"discountAmount\":\"" + formatCurrency(discountAmount) + "\","
                                        + "\"discountPercent\":" + discountPercentStr + ","
                                        + "\"totalFormatted\":\"" + formatCurrency(total) + "\""
                                        + "}");
                    } else {
                        sendErrorJSON(response, "Mã giảm giá đã hết hạn");
                    }
                } else {
                    sendErrorJSON(response, "Mã giảm giá không hợp lệ hoặc đã hết hạn");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            sendErrorJSON(response, "Lỗi khi xử lý yêu cầu");
        }
    }

    private void sendErrorJSON(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"valid\":false, \"message\":\"" + message + "\"}");
    }

    private String formatCurrency(BigDecimal amount) {
        return java.text.NumberFormat.getInstance(new java.util.Locale("vi", "VN")).format(amount);
    }
}
