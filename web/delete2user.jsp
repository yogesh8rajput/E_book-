<%-- 
    Document   : delete2user
    Created on : 18-Dec-2023, 8:48:24 am
    Author     : hp
--%>

<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete user Page</title>
    </head>
    <body>
           <%
        String Name=request.getParameter("id2");
        try
        {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","");
        //Statement st1=con.createStatement();
        Connection con=Database_connection.getconnection();
        PreparedStatement pt=con.prepareStatement("delete from user where UserId=?");
        pt.setString(1, Name);
        int i=pt.executeUpdate();
        if(i>0)
        {%>
        <jsp:forward page="showalluser.jsp"></jsp:forward>
        <%
        }
        else{ 
           out.print("not deleted");
         %>
         <jsp:include page="adminhome.jsp"></jsp:include>
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

