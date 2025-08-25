    package Controller;

    import DAO.OrderDAO;
    import Model.Order;
    import Model.User;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.HttpServlet;
    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;
    import java.io.IOException;
    import java.sql.SQLException;
    import java.util.List;

    @WebServlet(name = "OrderServlet", urlPatterns = {"/orders"})
    public class OrderServlet extends HttpServlet {

        private OrderDAO orderDAO;

        @Override
        public void init() {
            orderDAO = new OrderDAO();
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String action = request.getParameter("action");
            if ("detail".equals(action)) {
                viewDetail(request, response);
            } else {
                listOrders(request, response);
            }
        }

        private void listOrders(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            int page = 1;
            int pageSize = 10; // Có thể thay đổi
            String pageStr = request.getParameter("page");
            if (pageStr != null && !pageStr.isEmpty()) {
                try {
                    page = Integer.parseInt(pageStr);
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }

            try {
                List<Order> orders = orderDAO.getOrdersByUserIdWithPage(user.getUserId(), page, pageSize);
                int totalOrders = orderDAO.countOrdersByUserId(user.getUserId());
                int totalPages = (int) Math.ceil((double) totalOrders / pageSize);

                request.setAttribute("orders", orders);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);

                request.getRequestDispatcher("pages/orders.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle error, perhaps set error message
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
            }
        }

        private void viewDetail(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing order ID");
                return;
            }

            try {
                int orderId = Integer.parseInt(idStr);
                Order order = orderDAO.getOrderById(orderId);

                if (order == null || order.getUserId() != user.getUserId()) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
                    return;
                }

                request.setAttribute("order", order);
                request.getRequestDispatcher("pages/order-detail.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
            }
        }
    }