<%-- 
    Document   : showfeedback
    Created on : 17-Dec-2023, 6:17:23 pm
    Author     : hp
--%>

<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All User Page</title>
        <style>
            body{
                background: url("img/user.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                text-decoration: none;
                text-align: center;
                font-size: 25px;
            }
            table{
                text-align: center;
                margin-left: 250px;
                font-size: 25px;
            }
            a{
                text-decoration: none;
                color: black;
            }

        </style>
    </head>
    <body>
        <%
            String st = (String) session.getAttribute("user");
        %>
        <p align="center"> <% out.print("Welcome  " + st);
            %></p>
        <table border="2">

            <th>Name</th>
            <th>Username</th>
            <th>Mobile </th>        
            <th> Gmail  </th>
            <th>Feedback</th>
            <th> Delete  </th>
                <%
                    try {
                      //  Class.forName("com.mysql.cj.jdbc.Driver");
                        //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online", "root", "");
                      Connection con=Database_connection.getconnection();
                        Statement st1 = con.createStatement();
                        ResultSet rs = st1.executeQuery("Select*from feedback");
                        while (rs.next()) {%>
            <tr>

                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><a href="delete2u.jsp?id=<%=rs.getString(1)%>">Delete </td> </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                %>
        </table>
        <br>
        <span>Back to your home <a href="adminhome.jsp">Click 📩 here</a><br><br><span>
                </body>
                </html>

