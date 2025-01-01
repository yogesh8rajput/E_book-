<%-- 
    Document   : edit2
    Created on : 16-Dec-2023, 5:59:52?pm
    Author     : hp
--%>

<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Page</title>
    </head>
    <style>
          
            body{ background: url("img/log.jpg");
                  background-repeat: no-repeat; 
                  
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
            
        </style>
    </head>
    <body>
         <%
        try{
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","");
            Connection con=Database_connection.getconnection();
             String id=request.getParameter("id");
            PreparedStatement pt=con.prepareStatement("select * from user where UserId=?");
            pt.setString(1, id);
            ResultSet rs=pt.executeQuery();
            
            while(rs.next()){               
        %>
         <%
         String st=(String)session.getAttribute("user");
         %>
           <p align="center"> <% out.print("Welcome  "+st);
         %></p>
        <form action="update2" method="post">
            <h1>EDIT up form</h1>
            <table> 
                <input type="hidden" name="id"value="<%out.print(id);%>"><br> 
                
                <label>Enter the Name</label><br>
                    <input type="text" name="id"value="<%= rs.getString(2)%>"><br> 
             
                    <label>Enter the Username</label><br>
                    <input type="text" name="uname"value="<%= rs.getString(3)%>" ><br>
          
                
                  <label>Enter the Password</label><br>
                    <td><input type="password" name="pass"value="<%= rs.getString(4)%>" ><br>
               <label>Enter the Gmail</label><br>
                    <input type="email" name="gmail"value="<%= rs.getString(5)%>" ><br>
               
                     <label>Enter the Mobile</label><br>
                 <input type="long" name="mobile"value="<%= rs.getString(6)%>" ><br>
                    <label>Enter the Address</label><br>
                   <textarea id="id" name="add" value="<%= rs.getString(7)%>" ></textarea><br>
                <input type="submit" value="ok">
                     <input type="reset" value="Reset">
              
            </table>
            
        </form>
        
        <%
            }
            }
                catch(Exception e)
            {  
                out.print(e.getMessage());

                    }
        
        %>
    </body>
</html>
