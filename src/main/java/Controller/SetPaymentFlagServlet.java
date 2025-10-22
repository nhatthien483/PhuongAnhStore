package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/set-payment-flag")
public class SetPaymentFlagServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String paymentId = request.getParameter("paymentId");
        if (paymentId != null) {
            session.setAttribute("paymentId", paymentId);
        }
        response.setContentType("text/plain");
        response.getWriter().print("ok");
    }
}