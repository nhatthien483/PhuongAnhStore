package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy session hiện tại (nếu có)
        HttpSession session = request.getSession(false);

        // Nếu session tồn tại thì xóa
        if (session != null) {
            session.invalidate();
        }

        // Chuyển hướng về trang login (hoặc trang chủ nếu muốn)
        response.sendRedirect(request.getContextPath() + "/home");
    }
}
