/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package User;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import javax.swing.JOptionPane;

/**
 *
 * @author yoges
 */
@MultipartConfig
@WebServlet(name = "userSignin", urlPatterns = {"/userSignin"})
public class userSignin extends HttpServlet {

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
            out.println("<title>Servlet userSignin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userSignin at " + request.getContextPath() + "</h1>");
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
        PrintWriter pw = response.getWriter();
        response.setContentType("text/html");
        String na = request.getParameter("name");
        String pwd = request.getParameter("pass");
        String user = request.getParameter("uname");
        String adr = request.getParameter("add");
        String mail = request.getParameter("gmail");
        long num = Long.parseLong(request.getParameter("mobile"));
        Part file = request.getPart("pic");
        String filename = file.getSubmittedFileName();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/online_book", "root", "1234");
            PreparedStatement pt = con.prepareStatement("select*from user where Username=?");
            pt.setString(1, user);
            String drive_path = "E:/Online_Book/web/img2/" + filename;
            FileOutputStream fos = new FileOutputStream(drive_path);
            InputStream is = file.getInputStream();
            byte[] imageData = new byte[is.available()];
            is.read(imageData);
            fos.write(imageData);
            ResultSet rs = pt.executeQuery();
            if (rs.isBeforeFirst()) {
//                response.sendRedirect("Signup.html");
//                JOptionPane.showMessageDialog(null, "un Success");
                    response.sendRedirect("loginSignup.jsp?inavalid=USER");
//                pw.print("Already");
            } else {
                PreparedStatement pt1 = con.prepareStatement("insert into user (Name,Username,password,Gmail,Mobile,Address,image_data)values(?,?,?,?,?,?,?)");
                pt1.setString(1, na);
                pt1.setString(2, user);
                pt1.setString(3, pwd);
                pt1.setString(4, mail);
                pt1.setLong(5, num);
                pt1.setString(6, adr);
                pt1.setString(7, filename);
                int i = pt1.executeUpdate();
                if (i == 1) {
                    String path = getServletContext().getRealPath("") + "img2";
                    file.write(path + File.separator + filename);
//                    JOptionPane.showMessageDialog(null, "Success");
              response.sendRedirect("loginSignup.jsp?valid=USER");
//                    response.sendRedirect("loginSignup.jsp");
                }
            }

        } catch (Exception e) {
            pw.print(e.getMessage());

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
