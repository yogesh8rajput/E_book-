<%-- 
    Document   : userHome
    Created on : 09-Dec-2023, 8:23:44 pm
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
        <title>User Home Page</title>

    </head>
    <style>
        body{
            /*background: url("img/IMG_20240108_223351.jpg");*/
            background-color: black;
            background-repeat: no-repeat;
            background-size: cover;
            text-align: center;
            text-decoration: none;
            font-size: 35px;
            /*display: flex;*/
            /*margin-top: 60px;*/
            color: wheat;
        }
       
       
        img{

            border-radius: 30%;
            height: 300px;
            width: 300px;
            align-items: center;
        }
        .right,.left{
           
            flex: 1;
        }
        .left{
            padding: 2rem
        }
        .lr{
            display: flex;
        }

    </style>


    <body>
        <%@include file="usernavbar.jsp"%>
        <%
            // String st=(String)session.getAttribute("USER");

            //   out.print("Welcome  "+st);
        %>



        <br> <br>
        <%           String st = (String) session.getAttribute("USER");
         if (st != null)
         //{
//           
//            response.sendRedirect("userHome.jsp");
//            }
            
            {

                try {
                    //    int id= Integer.parseInt(request.getParameter("num"));
                    Connection con = Database_connection.getconnection();

                    PreparedStatement pst = con.prepareStatement("select * from user where Username=(?)");
                    pst.setString(1, st);
                    ResultSet rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        <div class="lr">
            <div class="left">
        <span align="center" color="">
          
         
         LIBRARIES ALWAYS REMIND ME THAT THERE ARE GOOD THINGS IN THIS WORLD.
          <br><br>
          
          <br><br>
          "A book is a gift you
          can open again and again."
        </span>
           

       
        </div>
        <div class="right">
        <img src="img2/<%=rs.getString("image_data")%>"  class="h-3 w-2 " alt="Not Found"/>
        <br><br>
         <p color="green">
            <% out.print("Welcome  " + rs.getString("UserId"));%><br>
            <% out.print("Welcome  " + rs.getString("Name"));%>
        </p>
        </div>
        </div>
        <%

                    } else {
                        out.print("enter valid id.");
                    }
                } catch (Exception ex) {
                }
            } else {
                response.sendRedirect("loginSignup.jsp");
            }

        %>

            
</script>
    </body>
</html>
