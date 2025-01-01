<%-- 
    Document   : uu
    Created on : 23-Dec-2023, 10:29:01 pm
    Author     : hp
--%>

<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Page</title>
    <span> <%@include file="adminnavbar.jsp"%></span>
        <style>
            body{
                background: url("img/add.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                text-decoration: none;
                text-align: center;
                font-size: 25px;
            }

            label{
                font-size: 30px;
            }
            input:hover{
                color:white;
                background-color: black;

            }
            a{
                text-decoration: none;
                color: black;
            }
            img{
                
                height: 300px;
                width: 300px;
                
            }

        </style>
    </head>
    <body>

       <%
        String st = (String) session.getAttribute("user");

            out.print("Welcome  " + st);
            if (st != null) {

        %> 
        <!--<h1>Welcome, <%= st%>!</h1>-->
        
    
        <%
            try {
                //Class.forName("com.mysql.cj.jdbc.Driver");
                //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online", "root", "");
                Connection con=Database_connection.getconnection();
                String id = request.getParameter("id");
                PreparedStatement pt = con.prepareStatement("select * from book where book_id=?");
                pt.setString(1, id);
                ResultSet rs = pt.executeQuery();

                while (rs.next()) {
        %>

        <form action="update" method="post"enctype="multipart/form-data">
            <!--<label>Book id</label><br>-->
            <input type="hidden" name="id"value="<%out.print(id);%>"><br>
            <label>Book Name</label><br>
            <input type="text" name="book_name"value="<%= rs.getString(2)%>"><br>
            <label>Auther</label><br>
            <input type="text" name="auther"value="<%=rs.getString(3)%>" ><br>
            <label>Quantity</label><br>
            <input type="text" name="quantity"value="<%=rs.getString(4)%>"><br>
            <label>Price</label><br>
            <input type="text" name="price"value="<%=rs.getString(5)%>"><br><br>
       <!--<input type="text" name="price"placeholder="Enter Book Price"><br><br>-->
        <input value="Submit" type="submit">
            <input value="Clear" type="reset"><br>
           <br>
           
            <!--<input value="update" type="submit">-->

            <!--<span>Back to your home <a href="adminhome.jsp">Click here</a><br><br><span>-->

                    </form>

       <form action="bookimg"method="post" enctype="multipart/form-data">
           <!--<label>Book id</label><br>-->
            <input type="hidden" name="id"value="<%out.print(id);%>"><br>
             <img src="book/<%= rs.getString("image_id") %>" class="profile-image" alt="Profile Image"/>
            <input type="file" name="pic" accept=".png,.jpg,.jpeg" value="<%=rs.getString("image_id")%>"   >
            <input value="Submit" type="submit">
            <input value="Clear" type="reset"><br>
       </form><br><br><br><br>
                    <%
                            }
                        } catch (Exception e) {
                            out.print(e.getMessage());

                 
}
        }else {
                    response.sendRedirect("adminlogin.jsp");
                }
            

                    %>
                     <span>Back to your home <a href="adminhome.jsp">Click here</a><br><br><span>

                    </body>
                    </html>
