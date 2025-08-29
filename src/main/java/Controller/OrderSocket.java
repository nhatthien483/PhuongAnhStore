package Controller;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;


import java.io.IOException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;


@ServerEndpoint("/orderSocket")
public class OrderSocket {
    // Lưu danh sách client đã kết nối
    private static Set<Session> clients = ConcurrentHashMap.newKeySet();

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("Client connected: " + session.hashCode());
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("Client disconnected: " + session.hashCode());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        // Nếu admin gửi tin nhắn thì in log
        System.out.println("Message from " + session.getId() + ": " + message);
    }

    // Hàm này để push thông báo khi có đơn hàng mới
    public static void notifyNewOrder(int orderId) throws IOException {
        for (Session client : clients) {
            client.getBasicRemote().sendText("newOrder:" + orderId);
        }
    }
}
