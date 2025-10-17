package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/qr-gen")
public class QrGenServlet extends HttpServlet {
    private static final String BANK_BIN = "970422";
    private static final String ACCOUNT_NUMBER = "098513955555";
    private static final String ACCOUNT_NAME = "NGUYEN VAN TOI";
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
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

        System.out.println(session.getAttribute("totalPrice"));
        System.out.println("Total price QR Code: " + amount);

        // Nội dung chuyển khoản
        String addInfo = "Thanh toan don hang " + System.currentTimeMillis();
        session.setAttribute("paymentId", addInfo);
        // Encode account name và nội dung
        String encodedAccountName = java.net.URLEncoder.encode(ACCOUNT_NAME, "UTF-8");
        String encodedInfo = java.net.URLEncoder.encode(addInfo, "UTF-8");

        // URL API VietQR
        String qrUrl = String.format(
                "https://img.vietqr.io/image/%s-%s-%s.png?amount=%d&addInfo=%s",
                BANK_BIN, ACCOUNT_NUMBER, encodedAccountName, amount, encodedInfo);

        // Gửi request lấy ảnh từ VietQR
        URL url = new URL(qrUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        response.setContentType("image/png");
        try (InputStream in = conn.getInputStream(); OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
