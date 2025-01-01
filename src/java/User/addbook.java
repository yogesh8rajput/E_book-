/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package User;

import Universal_connection.Database_connection;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import javax.swing.JOptionPane;

/**
 *
 * @author yoges
 */
@MultipartConfig
@WebServlet(name = "addbook", urlPatterns = {"/addbook"})
public class addbook extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addbook</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addbook at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
         PrintWriter pt=response.getWriter();
        response.setContentType("text/html");
        HttpSession session=request.getSession();
        pt.print("Welcome"+ session.getAttribute("user"));
       // int iid = Integer.parseInt(request.getParameter("book_id"));
         String bname=request.getParameter("book_name");
         String aut=request.getParameter("auther");
         String qu=request.getParameter("quantity");
         String pr=request.getParameter("price");
         Part file = request.getPart("pic");
         String filename = file.getSubmittedFileName();
       
         
         try
         {
            // Class.forName("com.mysql.cj.jdbc.Driver");
            // Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","");
             Connection con=Database_connection.getconnection();
             PreparedStatement pt2=con.prepareStatement("insert into book (Book_name,Auther,Quantity,Price,image_id) values(?,?,?,?,?)");
             pt2.setString(1, bname);
             pt2.setString(2, aut);
             pt2.setString(3, qu);
             pt2.setString(4, pr);
             pt2.setString(5, filename);
             String drive_path = "E:/Online_Book/web/book/" + filename;
            FileOutputStream fos = new FileOutputStream(drive_path);
            InputStream is = file.getInputStream();
            byte[] imageData = new byte[is.available()];
            is.read(imageData);
            fos.write(imageData);
             int i=pt2.executeUpdate();
             // int i = pt1.executeUpdate();
                if (i == 1) {
                    String path = getServletContext().getRealPath("") + "img2";
                    file.write(path + File.separator + filename);
                   JOptionPane.showMessageDialog(null, "Book Add Successfully");
             response.sendRedirect("Addbook.jsp");
             }
         }
             
             
             
         catch(Exception e)
         {
             pt.print(e.getMessage());
         }}
             


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
