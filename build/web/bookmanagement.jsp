<%@ page import="Universal_connection.Database_connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Management</title>
       <span> <%@include file="adminnavbar.jsp"%></span>
    <style>
        body {
            background: url("img/table2.jpg") no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            font-size: 20px;
            color: white;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.7);
            border: 1px solid #ddd;
            border-radius: 10px;
            /*margin: 15px;*/
            padding: 20px;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card img {
            height: 20rem;
            object-fit: cover;
            margin-bottom: 15px;
        }
        .card a {
            text-decoration: none;
            color: yellow;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <h1>Book Management</h1>
     <%
        String st = (String) session.getAttribute("user");

            out.print("Welcome  " + st);
            if (st != null) {

        %> 
        <!--<h1>Welcome, <%= st%>!</h1>-->
        
    %>
     
    
    
    
    <div class="container">
        <%
            try {
                Connection con = Database_connection.getconnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM book");

                while (rs.next()) {
        %>
        <div class="card">
            <img src="book/<%= rs.getString("image_id") %>" alt="Not Found"/>
            <h2><%= rs.getString("book_name") %></h2>
            <p><strong>Author:</strong> <%= rs.getString("auther") %></p>
            <p><strong>Quantity:</strong> <%= rs.getInt("quantity") %></p>
            <p><strong>Price:</strong> Rs:<%= rs.getDouble("price") %></p>
            <div>
                <a href="delete.jsp?id=<%= rs.getString("book_id") %>">Delete</a> |
                <a href="uu.jsp?id=<%= rs.getString("book_id") %>">Update</a>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                out.print("<p>Error: " + e.getMessage() + "</p>");
            }
 }
    
    
        else {
                    response.sendRedirect("adminlogin.jsp");
                }
            %>
       
    </div>
    
    <br>
    <span>Back to your home <a href="adminhome.jsp">Click 📩 here</a></span>
         <script>
    function autoRefresh() {
        window.location = window.location.href;
    }
    setInterval('autoRefresh()', 5000);
</script>
</body>
</html>
