package Controller;

import DAO.CommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/comment")
public class AdminCommentServlet extends HttpServlet {
    private CommentDAO commentDAO = new CommentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = 1;
        int pageSize = 10; // số comment mỗi trang
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        try {
            int totalComments = commentDAO.countAllComments();
            int totalPages = (int) Math.ceil((double) totalComments / pageSize);

            request.setAttribute("comments", commentDAO.getAllCommentsWithPage(page, pageSize));
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);

            request.getRequestDispatcher("/WEB-INF/views/admin/comment.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int commentId = Integer.parseInt(request.getParameter("commentId"));
            try {
                commentDAO.deleteComment(commentId);
                response.sendRedirect(request.getContextPath() + "/admin/comment?msg=deleted");
                return;
            } catch (SQLException e) {
                response.sendRedirect(request.getContextPath() + "/admin/comment?error=Lỗi khi xóa comment");
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/comment");
    }
}
