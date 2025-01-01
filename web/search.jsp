
<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Page</title>
    <style>
        body {
            background-color: black;
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
            background-color: white;
            color: black;
            border-radius: 10px;
            padding: 20px;
            width: 250px; /* Fixed width for cards */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .card img {
            height: 100px;
            width: auto;
            border-radius: 5px;
        }
        a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@include file="usernavbar.jsp"%>
<div class="card-container">

<%
    try {
        Connection con = Database_connection.getconnection();
        String pict = request.getParameter("cat");
        PreparedStatement pt = con.prepareStatement("SELECT * FROM book WHERE Book_Name =(?)");
        pt.setString(1, pict);
        ResultSet rs = pt.executeQuery();

      if (!rs.isBeforeFirst()) { // Check if there are no results
           out.print("<div style='color: red;'>No books found for this category.</div>");
      } else {
            while (rs.next()) {
%>
                <div class="card">
                <img src="book/<%= rs.getString("image_id")%>" alt="Book Image" />
                <h2><%= rs.getString("Book_Name")%></h2>
                <p>Author: <%= rs.getString("Auther")%></p>
                <p>Quantity: <%= rs.getString("Quantity")%></p>
                <p>Price: <%= rs.getString("Price")%></p>
                
                <a href="ad.jsp?id=<%= rs.getString(1)%>">Buy Now</a>
            </div>

<%
            }
        }
}
    catch (Exception e) {
      out.print("<div style='color: red;'>Error: " + e.getMessage() + "</div>");
    }
%>
</div>
</body>
</html>
