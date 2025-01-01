<%-- 
    Document   : adminhome
    Created on : 10-Dec-2023, 2:45:32 pm
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <style>
            body{
/*                background: url("img/bck.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                text-decoration: none;*/
background-color: #00BFA6;
                text-align: center;

                color: black;

            }
            a{
                text-decoration: none;
                color: orange;

            }
            span{
                padding: 0;
                margin: 0;
            }
            p{
                font-size: 50px;
            }

        </style>

    </head>
    <%--<%@include file="edit.jsp"%>--%>
    <body>
        <p align="center"><span> <%@include file="adminnavbar.jsp"%></span>

            <%
                String st = (String) session.getAttribute("user");
    //               String st = (String) session.getAttribute("USER");
                if (st != null) {
            %>  <% 

    //            response.sendRedirect("adminhome.jsp");
                try {
                    //    int id= Integer.parseInt(request.getParameter("num"));
                    Connection con = Database_connection.getconnection();

                    PreparedStatement pst = con.prepareStatement("select * from user where Name=(?)");
                    pst.setString(1, st);
                    ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    out.print("Welcome  " + rs.getString("Name"));%><br>

            
           <%

                    } 
                } catch (Exception ex) {
                }
            } else {
                response.sendRedirect("adminlogin.jsp");
            }

        %>

        </p>
        <div><img src="work/adminhome.svg"  height="645" alt="alt"/></div>

        <script>
            function autoRefresh() {
                window.location = window.location.href;
            }
            setInterval('autoRefresh()', 5000);
        </script>
    </body>
</html>
