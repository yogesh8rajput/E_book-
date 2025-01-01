<%-- 
    Document   : Feedback.jsp
    Created on : 14-Dec-2023, 10:32:58 pm
    Author     : hp
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Feedback in </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <style>
          
            body{ background: url("img/log.jpg");
                  background-repeat: no-repeat; 
                  align-items: center;
                 background-size: cover;
            }
            form{
                margin-left: 60px;
                font-size: 30px;
            }
            
            a:hover{
                color:brown;
                text-decoration: none;
            }
            input{
                font-size: 25px;
            }
             h1:hover{
                color:blue;
                text-decoration: none;
            }
            a{
                text-decoration: none;
                color: black;
            }
            
        </style>
    </head>
    <body>
        <form action="Feedback" method="post">
            <h1> Feedback form</h1>
            <table>
                
                <label>Enter the Name</label><br>
                    <input type="text" name="name"  placeholder="Enter your name"><br>
           
             
                    <label>Enter the Username</label><br>
                    <input type="text" name="uname" placeholder="Enter User name"><br>
          
              
               
                     <label>Enter the Mobile</label><br>
                 <input type="long" name="mobile" placeholder="Enter your Mobile No."><br>
                   <label>Enter the Gmail</label><br>
                 <input type="email" name="gmail" placeholder="Enter your Gmail"><br>
                    <label>Give the Your Feedback</label><br>
            <input type="text" name="fed" placeholder="Enter your Fedback"><br>
             <input type="submit" value="ok">
                     <input type="reset" value="Reset">
               <a href="index.html"><img src="./img/icon.png" height="40px"width="80px;" alt="alt"/></a>
                 
                      <br>
                      <span>Back to your home <a href="userHome.jsp"> 📩 Click here</a><br><br><span>
                    <%
        String st=(String)session.getAttribute("USER");
        %>
          <h1> <% out.print("Thankyou So Much  "+st);
         %></h1>
                              </table>
            
        </form>
       
    </body>
</html>
