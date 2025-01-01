<%-- 
    Document   : addcart
    Created on : 02-Jan-2024, 10:15:31 pm
    Author     : hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cart</title>
    </head>
    <body>
       
   
<%
    String id = request.getParameter("id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online", "root", "");
        PreparedStatement pst = con.prepareStatement("select * from bookmanage where BookId=?");
        pst.setString(1, id);
        ResultSet rs1 = pst.executeQuery();
        if (rs1.next()) {
            Integer kk = (Integer)session.getAttribute("count");
            int k = 1;
            if (kk == null) {
                session.setAttribute("count", new Integer(1));
            } else {
              k = kk;
              k = k+1;
              session.setAttribute("count", new Integer(k));
            }
            ArrayList a1 = new ArrayList();
            a1.add(rs1.getString(1));
            a1.add(rs1.getString(2));
            a1.add(rs1.getString(3));
            a1.add(rs1.getString(4));
            a1.add(rs1.getString(5));
            session.setAttribute("" +k,a1);
           response.sendRedirect("userBookDeatails.jsp");
             
        }
    }
    catch(Exception e){
    out.print(e.getMessage());
    }

%>
 </body>
</html>