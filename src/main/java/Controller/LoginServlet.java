/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.util.UUID;
import DAO.UserDAO;
import Model.User;
import Service.HashUtil;
import Service.MailUtil;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thien
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("pages/new_login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "register":
                handleRegister(request, response);
                break;
            case "forgot":
                try {
                    handleForgotPassword(request, response);
                } catch (IOException | ServletException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "google":
                handleGoogleLogin(request, response);
                break;
            default:
                response.sendRedirect("pages/new_login.jsp");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        jakarta.servlet.http.HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60 * 60);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(username, password);

        if (user != null) {
            request.getSession().setAttribute("user", user);
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("userId", user.getUserId());
            response.sendRedirect("home");
        } else {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("pages/new_login.jsp").forward(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        UserDAO userDAO = new UserDAO();
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(HashUtil.toMD5(request.getParameter("password")));
        user.setFullName(request.getParameter("fullname"));
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));
        user.setStatus("active");
        user.setRoleId(3);

        try {
            if (!userDAO.checkUsernameExists(user.getUsername()) && !userDAO.checkEmailExists(user.getEmail())) {
                String token = UUID.randomUUID().toString();
                userDAO.insertPendingUser(user, token);

                String verifyLink = request.getScheme() + "://" + request.getServerName() + ":"
                        + request.getServerPort()
                        + request.getContextPath() + "/verify?token=" + token;

                MailUtil.sendEmail(user.getEmail(), "Xác Nhận Tài Khoản",
                        "Vui lòng xác nhận tài khoản bằng cách nhấn vào link sau:<br>"
                                + "<a href='" + verifyLink + "'>Xác nhận</a>");

                request.setAttribute("mess", "Đăng ký thành công! Vui lòng kiểm tra email để xác nhận tài khoản.");
            } else {
                request.setAttribute("err", "Tên đăng nhập hoặc Email đã tồn tại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã có lỗi xảy ra trong quá trình đăng ký.");
        }
        request.getRequestDispatcher("/pages/new_register.jsp").forward(request, response);
        
    }

    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, MessagingException {
        String email = request.getParameter("email");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        if (user != null) {
            String token = UUID.randomUUID().toString();
            userDAO.saveResetToken(user.getUserId(), token); // lưu vào bảng token

            String resetLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/reset?token=" + token;

            MailUtil.sendEmail(email, "Đặt lại mật khẩu",
                    "Click vào liên kết sau để đặt lại mật khẩu:<br><a href='" + resetLink + "'>Đặt lại mật khẩu</a>");

            request.setAttribute("message", "Liên kết đặt lại mật khẩu đã được gửi đến email.");
        } else {
            request.setAttribute("error", "Không tìm thấy email trong hệ thống.");
        }

        request.getRequestDispatcher("pages/forgot_password.jsp").forward(request, response);
    }

    private void handleGoogleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Tích hợp Google Login API (OAuth2)
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