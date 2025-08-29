/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import com.google.gson.Gson;
import DAO.OrderDAO;
import Model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thien
 */
@WebServlet(name = "AdminOrderServlet", urlPatterns = { "/admin/order" })
public class AdminOrderServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteOrder(request, response);
            return;
        } else if ("detail".equals(action)) {
            viewDetail(request, response);
            return;
        }
        // Default: list orders
        OrderDAO oDAO = new OrderDAO();
        int totalOrders = oDAO.countAll(); // Renamed to totalOrders for clarity
        int ordersPerPage = 20;
        int totalPages = (int) Math.ceil((double) totalOrders / ordersPerPage);
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && pageParam.matches("\\d+")) {
            currentPage = Integer.parseInt(pageParam);
        }
        try {
            List<Order> orders = oDAO.getOrderByPage(currentPage, ordersPerPage);
            String format = request.getParameter("format");
            if ("json".equals(format)) {
                Map<String, Object> data = new HashMap<>();
                data.put("orders", orders);
                data.put("totalPages", totalPages);
                data.put("currentPage", currentPage);
                Gson gson = new Gson();
                String json = gson.toJson(data);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().print(json);
            } else {
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("/WEB-INF/views/admin/order.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/order?error=Missing order ID");
            return;
        }
        OrderDAO oDAO = new OrderDAO();
        try {
            int orderId = Integer.parseInt(idStr);
            boolean deleted = oDAO.deleteOrder(orderId); // Assume OrderDAO has deleteOrder method
            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/admin/order?msg=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/order?error=Failed to delete order");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/order?error=Invalid order ID");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/order?error=Database error during deletion");
        }
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
        String orderIdStr = request.getParameter("serviceAppointmentId");
        String status = request.getParameter("status");
        System.out.println("Order Id: " + orderIdStr);
        try {
            int orderId = Integer.parseInt(orderIdStr);
            OrderDAO oDAO = new OrderDAO();
            boolean updated = oDAO.updateOrderStatus(orderId, status);
            if (updated) {
                OrderSocket.notifyNewOrder(orderId);
                response.sendRedirect(request.getContextPath() + "/admin/order?msg=updated");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/order?error=Failed to update order status");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/order?error=Invalid order ID");
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

    private void viewDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing order ID");
            return;
        }

        try {
            int orderId = Integer.parseInt(idStr);
            Order order = orderDAO.getOrderById(orderId);
            if (order == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
                return;
            }
            request.setAttribute("order", order);
            request.getRequestDispatcher("/WEB-INF/views/admin/order_detail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}