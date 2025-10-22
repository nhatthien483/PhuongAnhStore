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
import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

@WebServlet("/qr-gen")
public class QrGenServlet extends HttpServlet {
    private static final String BANK_BIN = "970422";
    private static final String ACCOUNT_NUMBER = "098513955555";
    private static final String ACCOUNT_NAME = "NGUYEN VAN TOI";
    private static final String TEMPLATE = "compact";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        BigDecimal totalPrice = (BigDecimal) session.getAttribute("totalPriceDiscount");
        if (totalPrice == null) {
            totalPrice = (BigDecimal) session.getAttribute("totalPrice");
        }
        long amount = totalPrice != null ? totalPrice.longValue() : 0;

        String addInfo = "Thanh toan don hang " + System.currentTimeMillis();
        String encodedAccountName = java.net.URLEncoder.encode(ACCOUNT_NAME, "UTF-8");
        String encodedInfo = java.net.URLEncoder.encode(addInfo, "UTF-8");

        String qrUrl = String.format(
                "https://img.vietqr.io/image/%s-%s-%s.png?amount=%d&addInfo=%s&accountName=%s",
                BANK_BIN, ACCOUNT_NUMBER, TEMPLATE, amount, encodedInfo, encodedAccountName);

        URL url = new URL(qrUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        String format = request.getParameter("format");
        if ("json".equals(format)) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            try (InputStream in = conn.getInputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    baos.write(buffer, 0, bytesRead);
                }
            }
            String base64 = Base64.getEncoder().encodeToString(baos.toByteArray());
            response.setContentType("application/json");
            response.getWriter().write("{\"base64\": \"" + base64 + "\", \"addInfo\": \"" + addInfo + "\"}");
        } else {
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
}