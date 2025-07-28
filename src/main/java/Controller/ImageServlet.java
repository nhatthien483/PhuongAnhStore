/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/Images/*")
public class ImageServlet extends HttpServlet {
    //private final String BASE_DIR = "D:/Document/PhuongAnhStore/Images"; // đường dẫn thư mục ảnh khi chạy local

    private final String BASE_DIR = "/var/www/phuonganhstore/Images"; // đường dẫn thư mục ảnh khi chạy VPS

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String requestedImage = request.getPathInfo(); // "/sac_du_phong/remax_rpp679.png"

        if (requestedImage == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
            return;
        }

        File imageFile = new File(BASE_DIR, requestedImage);
        if (!imageFile.exists() || imageFile.isDirectory()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
            return;
        }

        String mime = request.getServletContext().getMimeType(imageFile.getName());
        if (mime == null) mime = "application/octet-stream";
        response.setContentType(mime);
        response.setContentLength((int) imageFile.length());

        try (BufferedInputStream in = new BufferedInputStream(new FileInputStream(imageFile));
             OutputStream out = response.getOutputStream()) {

            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
