/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;

import DAO.UserDAO;
import Service.HashUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thien
 */
@WebServlet("/reset")
public class ResetPasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("pages/reset_password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        int userId = userDAO.getUserIdByResetToken(token);

        if (userId > 0) {
            userDAO.updatePassword(userId, HashUtil.toMD5(newPassword));
            userDAO.clearResetToken(token);
            request.setAttribute("success", "Mật khẩu đã được cập nhật thành công.");
            request.getRequestDispatcher("pages/reset_success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Liên kết không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("pages/reset_password.jsp").forward(request, response);
        }
    }
}

