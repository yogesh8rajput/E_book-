<%-- 
    Document   : update
    Created on : 16-Dec-2023, 5:39:27 pm
    Author     : hp
--%>

<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book</title>
    <style>
          body{ background: url("img/add.jpg");
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
            
        </style>
    </head>
    
        <h1>  <%
        String st=(String)session.getAttribute("user");
        %>
          <p align="center"> <% out.print("Welcome  "+st);
         %></p></h1>
        <h1>📩📩📩📩?</h1>
        <form action="update">
            <label>Book id</label><br>
            <input type="text" name="book_id"placeholder="Enter Book id"><br>
            <label>Book Name</label><br>
            <input type="text" name="book_name"placeholder="Enter Book Name"><br>
            <label>Auther</label><br>
            <input type="text" name="auther"placeholder="Enter Book Auther"><br>
            <label>Quantity</label><br>
            <input type="text" name="quantity"placeholder="Enter Book Quantity"><br>
            <label>Price</label><br>
            <input type="text" name="price"placeholder="Enter Book Price"><br><br>
            
            <input value="update" type="submit">
            <input value="Clear" type="reset"><br><br>
             <span>Back to your home <a href="adminhome.jsp">Click here</a><br><br><span>
            
        </form>
       <%
        
         %>
           <p align="center"> <% out.print("Welcome  "+st);
         %></p>
          <table border="2">
    
            <th>Bookid</th>
         <th> Bookname  </th>
         <th>Auther</th>
         <th>Quantity </th>
         <th>Price</th>
        
          <th> Delete  </th>
          <%
        try
        {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","");
       Statement st1 = con.createStatement();
        ResultSet rs = st1.executeQuery("Select*from bookmanage");
        while (rs.next())
        {  %>
          <tr>
         
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><a href="delete2user.jsp?id2=<%=rs.getString(1)%>">Delete </td> </tr>
        <%
            }
}
            catch(Exception e)
                {
                out.print(e.getMessage());
                }
                %>
          </table>
        %>
        
    
</html>
