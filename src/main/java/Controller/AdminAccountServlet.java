package Controller;

import DAO.UserDAO;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminAccountServlet", urlPatterns = { "/admin/users" })
public class AdminAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kiểm tra quyền truy cập của người dùng
        HttpSession session = request.getSession();
        Object roleObj = session.getAttribute("role");
        if (roleObj instanceof Integer) {
            int role = (Integer) roleObj;
            if (role != 1) {
            request.getRequestDispatcher("/pages/not_admin.jsp").forward(request, response);
                return;
            }
        }
        UserDAO userDAO = new UserDAO();
        int totalUsers = userDAO.countAll();
        int usersPerPage = 20;
        int totalPages = (int) Math.ceil((double) totalUsers / usersPerPage);
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && pageParam.matches("\\d+")) {
            currentPage = Integer.parseInt(pageParam);
        }

        String action = request.getParameter("action");
        if ("search".equals(action)) {
            String searchQuery = request.getParameter("keyword");
            try {
                List<User> userList = userDAO.searchProductByKeywords(searchQuery);
                request.setAttribute("users", userList);
                request.setAttribute("keyword", searchQuery);
                request.getRequestDispatcher("/WEB-INF/views/admin/account_list.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if ("viewDetail".equals(action)) {
            String userId = request.getParameter("id");
            if (userId != null && userId.matches("\\d+")) {
                try {
                    User user = userDAO.getUserById(Integer.parseInt(userId));
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/WEB-INF/views/admin/account_detail.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/users");
            }
        } else if ("edit".equals(action)) {
            String userId = request.getParameter("id");
            User user = null;
            try {
                user = userDAO.getUserById(Integer.parseInt(userId));
                request.setAttribute("user", user);
                request.getRequestDispatcher("/WEB-INF/views/admin/account_edit.jsp").forward(request, response);
            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
            }

        } else if ("delete".equals(action)) {
            String userId = request.getParameter("id");
            if (userId != null && userId.matches("\\d+")) {
                try {
                    userDAO.deleteUser(Integer.parseInt(userId));
                    request.getSession().setAttribute("notification", "Xoá người dùng thành công.");
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.getSession().setAttribute("messageType", "danger");
                    request.getSession().setAttribute("message", "Lỗi khi xoá người dùng.");
                }
            }
            response.sendRedirect(request.getContextPath() + "/admin/users");
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/views/admin/account_add.jsp").forward(request, response);
        } else {
            List<User> users = null;
            try {
                users = userDAO.getUsersByPage(currentPage, usersPerPage);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("users", users);
            request.getRequestDispatcher("/WEB-INF/views/admin/account_list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();

        if ("edit".equals(action)) {
            int userId = Integer.parseInt(request.getParameter("id"));
            try {
                User user = userDAO.getUserById(userId);
                if (user != null) {
                    user.setFullName(request.getParameter("fullname"));
                    user.setPhone(request.getParameter("phone"));
                    user.setAddress(request.getParameter("address"));
                    user.setEmail(request.getParameter("email")); // bạn thiếu dòng này
                    user.setRoleId(Integer.parseInt(request.getParameter("roleId")));
                    user.setStatus(request.getParameter("status"));
                    user.setCreateAt(Date.valueOf(request.getParameter("createAt"))); // phải đúng kiểu java.sql.Date
                    userDAO.updateUser(user);
                    request.getSession().setAttribute("notification", "Cập nhật người dùng thành công.");
                } else {
                    request.getSession().setAttribute("message", "Không tìm thấy người dùng");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.getSession().setAttribute("notification", "Có lỗi xảy ra khi cập nhật");
            }
        } else if ("add".equals(action)) {
            User newUser = new User();
            newUser.setUsername(request.getParameter("username"));
            newUser.setFullName(request.getParameter("fullname"));
            newUser.setPhone(request.getParameter("phone"));
            newUser.setAddress(request.getParameter("address"));
            newUser.setEmail(request.getParameter("email"));
            newUser.setRoleId(Integer.parseInt(request.getParameter("roleId")));
            newUser.setStatus(request.getParameter("status"));
            newUser.setPassword(request.getParameter("password"));
            try {
                if (userDAO.checkUsernameExists(newUser.getUsername())
                        || userDAO.checkEmailExists(newUser.getEmail())) {
                    request.setAttribute("message", "Tên đăng nhập hoặc email đã tồn tại.");
                    request.getRequestDispatcher("/WEB-INF/views/admin/account_add.jsp").forward(request, response);
                    return;
                }
                userDAO.addUser(newUser);
                request.setAttribute("notification", "Thêm người dùng thành công.");
            } catch (SQLException e) {
                e.printStackTrace();
                request.getSession().setAttribute("messageType", "danger");
                request.getSession().setAttribute("notification", "Lỗi khi thêm người dùng.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }

}
