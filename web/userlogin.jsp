<%-- 
    Document   : userlogin
    Created on : 08-Dec-2023, 5:45:12 pm
    Author     : hp
--%>

<%@page import="Universal_connection.Database_connection"%>
<%--<%@page import="Universal_connection.Database_connection"%>--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User login Page</title>




    <body>

        <%

            try {
                //  Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = Database_connection.getconnection();
                //  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/online_book", "root", "1234");
                PreparedStatement pt = con.prepareStatement("select*from user where Username=? and Password=?");
                String uname = request.getParameter("na");
                String pass = request.getParameter("pw");
                pt.setString(1, uname);
                pt.setString(2, pass);

                ResultSet rs = pt.executeQuery();
                //String na = rs.getString("Name");
                //out.print(na);
                if (rs.isBeforeFirst()) {
                    // session.setAttribute("user", na);
                    session.setAttribute("USER", uname);
                    //  out.print("yes user "+uname);
//        RequestDispatcher rd=request.getRequestDispatcher("userHome.jsp");
//        rd.forward(request, response);
                    response.sendRedirect("userHome.jsp");
                } else {
//         RequestDispatcher rd=request.getRequestDispatcher("login.html");
//        rd.include(request, response);
                    response.sendRedirect("login.jsp");

                }
            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
