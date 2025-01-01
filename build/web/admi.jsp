<%-- 
    Document   : admi
    Created on : 15-Oct-2024, 8:16:46 pm
    Author     : yoges
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <style>
            body{
                background: url("img/bck.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                text-decoration: none;
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
        <span><%@include file="adminnavbar.jsp"%></span>
        <%
            String st = (String) session.getAttribute("user");
//               String st = (String) session.getAttribute("USER");
//         if (st != null)
//        {
//           
//            response.sendRedirect("admi.jsp");
//            }
//            else{
//               response.sendRedirect("login.jsp");
//        }
        %>
        <p align="center"> <% out.print("Welcome  " + st);
          %></p>
<!--//        <a href="Addbook.jsp">Add Book</a><br><br>
//        <a href="showalluser.jsp">Show All Data </a><br><br>
//        <a href="showfeedback.jsp">Feedback</a><br><br>
//        <a href="bookmanagement.jsp">Book Management</a><br><br>
//        <a href="adminlogin.jsp">Log out</a>-->


    </body>
</html>
