/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ProductDAO;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utility.ConnectionManager;

/**
 *
 * @author jesperlim
 */
@WebServlet(name = "ImageServlet", urlPatterns = {"/ImageServlet"})
public class ImageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        String req = "";
        Blob img;
        byte[] imgData = null;

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("Select filename From product Where product_id = ?");

            stmt.setString(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                img = rs.getBlob(1);
                imgData = img.getBytes(1, (int) img.length());
                InputStream input = rs.getBinaryStream("filename");
                OutputStream output = response.getOutputStream();

                //final byte[] imageBytes = readImageBytes(IMAGE_PATH);
                final String imageFormat = determineImageFormat(imgData);
                System.out.println("Image format is " + imageFormat);

                response.setContentType("image/" + imageFormat);
                // Now write input to output the usual way.
                output.write(imgData);
                output.flush();
                output.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
    }

    private static byte[] readImageBytes(String imagePath) throws IOException {
        final File imageFile = new File(imagePath);
        final byte[] buf = new byte[(int) imageFile.length()];

        final FileInputStream fStream = new FileInputStream(imageFile);
        fStream.read(buf);
        fStream.close();

        return buf;
    }

    private static String determineImageFormat(byte[] imageBytes) throws IOException {

        final ByteArrayInputStream bStream = new ByteArrayInputStream(imageBytes);

        final ImageInputStream imgStream = ImageIO.createImageInputStream(bStream);
        final Iterator<ImageReader> iter = ImageIO.getImageReaders(imgStream);

        final ImageReader imgReader = iter.next();

        return imgReader.getFormatName();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
