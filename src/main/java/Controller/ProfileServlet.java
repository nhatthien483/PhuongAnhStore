/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.sql.SQLException;

import DAO.UserDAO;
import Model.User;
import Service.HashUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thien
 */
@WebServlet(name = "ProfileServlet", urlPatterns = { "/profile" })
public class ProfileServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        String action = request.getParameter("action");
        UserDAO uDAO = new UserDAO();

        try {
            if ("address".equals(action)) {
                String newAddress = request.getParameter("newAddress");
                boolean success = uDAO.updateAddress(newAddress, userId);
                if (success) {
                    request.setAttribute("message", "Cập nhật địa chỉ thành công.");
                } else {
                    request.setAttribute("message", "Cập nhật địa chỉ không thành công.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Đã xảy ra lỗi trong quá trình cập nhật địa chỉ.");
        }

        request.getRequestDispatcher("pages/profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        UserDAO uDAO = new UserDAO();
        int userId = (int) session.getAttribute("userId");

        if ("updateProfile".equals(action)) {
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            try {
                User user = uDAO.getUserById(userId);
                user.setFullName(fullName);
                user.setEmail(email);
                user.setPhone(phone);
                uDAO.updateUser(user);

                request.setAttribute("message", "Cập nhật thông tin cá nhân thành công.");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Đã xảy ra lỗi khi cập nhật thông tin cá nhân.");
            }
            request.getRequestDispatcher("pages/profile.jsp").forward(request, response);
        }
        if ("changePassword".equals(action)) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            try {
                User user = uDAO.getUserById(userId);

                // Kiểm tra mật khẩu hiện tại
                if (!user.getPassword().equals(HashUtil.toMD5(currentPassword))) {
                    request.setAttribute("message", "Mật khẩu hiện tại không đúng.");
                } else if (!newPassword.equals(confirmPassword)) {
                    // Kiểm tra mật khẩu mới và xác nhận mật khẩu
                    request.setAttribute("message", "Mật khẩu mới và xác nhận mật khẩu không khớp.");
                } else {
                    // Cập nhật mật khẩu mới
                    uDAO.updatePassword(userId, HashUtil.toMD5(newPassword));
                    request.setAttribute("message", "Cập nhật mật khẩu thành công.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Đã xảy ra lỗi khi cập nhật mật khẩu.");
            }
            request.getRequestDispatcher("pages/profile.jsp").forward(request, response);
        }

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
