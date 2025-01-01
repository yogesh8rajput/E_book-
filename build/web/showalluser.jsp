<%-- 
    Document   : showalluser
    Created on : 09-Dec-2023, 8:22:12 pm
    Author     : hp
--%>

<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All User Page</title>
  
    <style>
        body {
             /*background: url("img/index.jpg");*/
             background-color: black;
            background-repeat: no-repeat;
            background-size: cover;
            text-decoration: none;
            text-align: center;
            font-size: 25px;
            color: white; /* Change text color for better visibility */
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 20px;
        }
        .card {
            background-color:white;
            color: black;
            border-radius: 10px;
            padding: 12px;
            height: 20rem;
            width: 50%; /* Fixed width for cards */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            display: flex;
        }
        .card img {
            height: 15rem;
            width: 15rem;
            border-radius: 5px;
        }
        a {
            text-decoration: none;
            color: black;
        }
        .di{
            flex: 1;
            height: 18rem;
            display: grid; 
            place-items: center;

            gap: 1rem;
        }
        .di2{
            flex: 1;
            height: 18rem;          
            display: grid;
            place-items: center;
        }
        .button{
            color: green;
            background-color: red;
            border-radius: 30%;
             padding: 5px;
             
        }
        .button:hover{
            color: red;
            background-color: green;
            border-radius: 30%;
           
        }
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp"%>
    <%
        String st = (String) session.getAttribute("user");

            out.print("Welcome  " + st);
            if (st != null) {

        %> 
        
        
    
    <div class="card-container">
        <%
            try {
                Connection con = Database_connection.getconnection();
                Statement st1 = con.createStatement();
                ResultSet rs = st1.executeQuery("SELECT * FROM user");
                while (rs.next()) { 
        %>
            <div class="card">
                <div class="di">
                     <img src="img2/<%= rs.getString("image_data") %>" alt="Not Found"/>
                     <div>
                    <a class="button" href="delete2user.jsp?id2=<%= rs.getString(1) %>">Delete</a>
                    <a class="button" href="edit2.jsp?id=<%= rs.getString(1) %>">Update</a>
                </div>
                </div>
                <div class="di2">
                     <h3><%= rs.getString(2) %></h3> <!-- Name -->
                <p>Username: <%= rs.getString(3) %></p> <!-- Username -->
                <p>Password: <%= rs.getString(4) %></p> <!-- Password -->
                <p>Gmail: <%= rs.getString(5) %></p> <!-- Gmail -->
                <p>Number: <%= rs.getString(6) %></p> <!-- Number -->
                <p>Address: <%= rs.getString(7) %></p> <!-- Address -->
                </div> 
               
               
            </div>
        <%
                }
            } catch (Exception e) {
                out.print(e.getMessage());
            }
}
 else {
                    response.sendRedirect("adminlogin.jsp");
                }
        %>
    </div>
    <br>
   
    <span>Back to your home <a href="adminhome.jsp">Click here</a></span><br><br>
         <script>
    function autoRefresh() {
        window.location = window.location.href;
    }
    setInterval('autoRefresh()', 5000);
</script>
</body>
</html>
