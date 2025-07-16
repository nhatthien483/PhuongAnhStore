package Service;

import java.io.IOException;

import DAO.UserDAO;
import Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        UserDAO userDAO = new UserDAO();

        if (token == null || token.isEmpty()) {
            request.setAttribute("error", "Liên kết không hợp lệ.");
            request.getRequestDispatcher("pages/login.jsp").forward(request, response);
            return;
        }

        try {
            User user = userDAO.getPendingUserByToken(token);
            if (user != null) {
                userDAO.confirmUserRegistration(user, token);

                //Chuyển đến trang xác nhận thành công
                request.getRequestDispatcher("pages/verify_success.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Liên kết xác nhận không hợp lệ hoặc đã hết hạn.");
                request.getRequestDispatcher("pages/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã có lỗi xảy ra trong quá trình xác nhận.");
            request.getRequestDispatcher("pages/login.jsp").forward(request, response);
        }
    }
}

