<%-- 
    Document   : delete
    Created on : 09-Dec-2023, 9:18:05 pm
    Author     : hp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Statement"%>
<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
       
          <%
              int Book_id=Integer.parseInt(request.getParameter("id"));

//        String Book_name=request.getParameter("id");
        try
        {
       // Class.forName("com.mysql.cj.jdbc.Driver");
       // Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","");
        //
        Connection con=Database_connection.getconnection();
        PreparedStatement pt=con.prepareStatement("delete from book where Book_id=?");
//        Statement st1=con.createStatement();
//        pt.setString(Integer.parseInt(request.getParameter(1, "id"));
        pt.setInt(1, Book_id);
        int i=pt.executeUpdate();
        if(i>0)
        {%>
             <%--<jsp:forward page="bookmanagement.jsp"></jsp:forward>--%>
        <%
            JOptionPane.showMessageDialog(null, "Delete Successfully");
             response.sendRedirect("bookmanagement.jsp");
        }
        else{ 
           out.print("not deleted");
         %>
        <jsp:include page="a.html"></jsp:include>
        <%
}
}

        
         catch (Exception e)
        {
        out.print(e.getMessage());
        }
        %>
    </body>
</html>
