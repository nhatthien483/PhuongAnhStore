package Controller;

import DAO.CommentDAO;
import Model.Comment;
import Model.User; // giả sử có User lưu trong session
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    private CommentDAO commentDAO = new CommentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String commentText = request.getParameter("commentText");

        // Lấy user từ session
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user"); 

        if (user == null) {
            // Nếu chưa login thì quay về login
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Comment c = new Comment();
        c.setProductId(productId);
        c.setUserId(user.getUserId());
        c.setCommentText(commentText);

        try {
            commentDAO.addComment(c);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        // Quay lại trang chi tiết sản phẩ
        response.sendRedirect(request.getContextPath() + "/list-all-product?action=viewDetail&id=" + productId);
        //response.sendRedirect(request.getContextPath() + "/productDetail?productId=" + productId);
    }
}
