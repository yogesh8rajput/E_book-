<%-- 
    Document   : ad
    Created on : 06-Jan-2024, 12:01:59 pm
    Author     : hp
--%>

<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add Page</title>
    </head>
    <body>
       
   
<%
    String id = request.getParameter("id");
    try {
        //Class.forName("com.mysql.cj.jdbc.Driver");
        //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online", "root", "");
        Connection con=Database_connection.getconnection();
        PreparedStatement pst = con.prepareStatement("select * from book where Book_Id=?");
        pst.setString(1, id);
        ResultSet rs1 = pst.executeQuery();
        if (rs1.next()) {
            Integer ii = (Integer)session.getAttribute("count");
            int i = 1;
            if (ii == null) {
                session.setAttribute("count", new Integer(1));
            } else {
              i = ii;
              i = i+1;
              session.setAttribute("count", new Integer(i));
            }
            ArrayList a1 = new ArrayList();
            a1.add(rs1.getString(1));
            a1.add(rs1.getString(2));
            a1.add(rs1.getString(3));
            a1.add(rs1.getString(4));
            a1.add(rs1.getString(5));
            session.setAttribute("" + i,a1);
           response.sendRedirect("userBookDeatails.jsp");
             
        }
    }
    catch(Exception e){
    out.print(e.getMessage());
    }

%>
 </body>
</html>