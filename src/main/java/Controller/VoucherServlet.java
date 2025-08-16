package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Date;

import DAO.CartDAO;
import DAO.CartDetailDAO;
import DAO.VoucherDAO;
import Model.Cart;
import Model.CartDetail;
import Model.Voucher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "VoucherServlet", urlPatterns = { "/voucher" })
public class VoucherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        VoucherDAO voucherDAO = new VoucherDAO();

        try {
            if ("check".equals(action)) {
                String code = request.getParameter("code");
                HttpSession session = request.getSession();
                int userId = (int) session.getAttribute("userId");
                CartDAO cDAO = new CartDAO();
                Cart cart = cDAO.getCartByUserId(userId);

                if (cart == null) {
                    response.getWriter().write("{\"valid\":false, \"message\":\"Giỏ hàng trống\"}");
                    return;
                }
                // Tính subtotal từ CartDetail
                BigDecimal subtotal = cart.getCartPrice();

                // Kiểm tra voucher
                // Kiểm tra voucher
                Voucher voucher = voucherDAO.getVoucherByCode(code);
                if (voucher != null && voucher.getQuantity() > 0) {
                    // Lấy ngày hôm nay (chỉ phần ngày)
                    java.time.LocalDate today = java.time.LocalDate.now();
                    java.time.LocalDate expiry = voucher.getExpiryDate().toLocalDate();

                    // Còn hạn nếu expiry >= today
                    if (!expiry.isBefore(today)) {
                        session.setAttribute("voucherId", voucher.getId());
                        BigDecimal discountAmount = subtotal.multiply(
                                BigDecimal.valueOf(voucher.getDiscount()).divide(BigDecimal.valueOf(100)));
                        BigDecimal total = subtotal.subtract(discountAmount);
                        System.out.println("Subtotal: " + subtotal);
                        System.out.println("Ma giam: " + voucher.getDiscount());
                        System.out.println("Giam gia: " + discountAmount);
                        System.out.println("Sau khi giam: " + total);
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        DecimalFormat df = new DecimalFormat("#.##"); // tối đa 2 chữ số thập phân
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
                        response.getWriter().write(
                                "{\"valid\":false, \"message\":\"Mã giảm giá đã hết hạn\"}");
                    }
                } else {
                    response.getWriter().write(
                            "{\"valid\":false, \"message\":\"Mã giảm giá không hợp lệ hoặc đã hết hạn\"}");
                }

            } else if ("list".equals(action)) {
                List<Voucher> vouchers = voucherDAO.getAllVouchers();
                request.setAttribute("vouchers", vouchers);
                request.getRequestDispatcher("pages/voucher.jsp").forward(request, response);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Voucher voucher = voucherDAO.getVoucherById(id);
                request.setAttribute("voucher", voucher);
                request.getRequestDispatcher("pages/edit-voucher.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý yêu cầu.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        VoucherDAO voucherDAO = new VoucherDAO();

        try {
            if ("add".equals(action)) {
                String code = request.getParameter("code");
                double discount = Double.parseDouble(request.getParameter("discount"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String expiryDate = request.getParameter("expiryDate");

                Voucher voucher = new Voucher();
                voucher.setCode(code);
                voucher.setDiscount(discount);
                voucher.setQuantity(quantity);
                voucher.setExpiryDate(java.sql.Date.valueOf(expiryDate));

                voucherDAO.addVoucher(voucher);
                response.sendRedirect("voucher?action=list");
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String code = request.getParameter("code");
                double discount = Double.parseDouble(request.getParameter("discount"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String expiryDate = request.getParameter("expiryDate");

                Voucher voucher = new Voucher();
                voucher.setId(id);
                voucher.setCode(code);
                voucher.setDiscount(discount);
                voucher.setQuantity(quantity);
                voucher.setExpiryDate(java.sql.Date.valueOf(expiryDate));

                voucherDAO.updateVoucher(voucher);
                response.sendRedirect("voucher?action=list");
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                voucherDAO.deleteVoucher(id);
                response.sendRedirect("voucher?action=list");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý yêu cầu.");
        }
    }

    private String formatCurrency(BigDecimal amount) {
        return java.text.NumberFormat.getInstance(new java.util.Locale("vi", "VN")).format(amount);
    }
}
