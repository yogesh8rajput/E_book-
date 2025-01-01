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
        <title>User Details Book</title>
       
        <style>
            body {
                /*1background: url("img/tablebg.jpg");*/
                background-color: black;
                background-repeat: no-repeat;
                background-size: cover;
                text-align: center;
                font-size: 18px;
/*                margin-top: 40px;*/
            }
            h1 {
                color: white;
            }
            .card-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
            }
            .card {
                background-color: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
/*                width: 180px;
                height: 350px;*/
                padding: 20px;
                margin: 20px;
                text-align: left;
                position: relative;
            }
            .card img {
                /*width: 65%;*/
                height: 20rem;
                border-radius: 10px;
                /*object-fit: contain;*/
            }
            .card h2 {
                font-size: 20px;
                margin-bottom: 10px;
            }
            .card p {
                font-size: 16px;
                margin-bottom: 5px;
            }
            .card a {
                text-decoration: none;
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                border-radius: 5px;
                float: right;
                /*position: relative;*/
                
/*                bottom: 3rem;
                left: 7rem;*/
            }
            a img {
                height: 5rem;
                /*width: 70px;*/
            }
            form{
                flex: 1;
                display: flex;
            }
            span{
                color: white;
                font-weight: bolder;
            }
        </style>
    </head>
     <%@include file="usernavbar.jsp"%>
    <body>
        
        <%--<%@include file="search.jsp"%>--%>
        <%
//            String st = (String) session.getAttribute("USER");
            int i = 0;
            String st = (String) session.getAttribute("USER");

            out.print("Welcome  " + st);
            if (st != null) {

        %> 
        <h1>Welcome, <%= st%>!</h1>

        <a href="o.jsp"><img src="img/order.png" alt="Cart" /> </a>
        <span>
            
        Cart: <%= (Integer) session.getAttribute("count")%>
        </span>
        
          <form action="search.jsp">
                <select name="cat">
                    <option value="JAVA" name="cat">JAVA</option>
                    <option value="PYTHON" name="cat" >PYTHON</option>
                    <option value="C++" name="cat">C++</option>
                    <option value="MATHS" name="cat">MATHS</option><br>
                </select>

                <input type="submit" value="Submit">
            </form>
        <br><br >
         


        <div class="card-container">
            <%
                try {
                    Connection con = Database_connection.getconnection();
                    Statement st1 = con.createStatement();
                    ResultSet rs = st1.executeQuery("SELECT * FROM book");

                    while (rs.next()) {
            %>
            <div class="card">
                <img src="book/<%= rs.getString("image_id")%>" alt="Book Image" />
                <h2><%= rs.getString("Book_Name")%></h2>
                <p>Author: <%= rs.getString("Auther")%></p>
                <p>Quantity: <%= rs.getString("Quantity")%></p>
                <p>Price:₹<%= rs.getString("Price")%>/-</p>
                
                <a href="ad.jsp?id=<%= rs.getString(1)%>">Buy Now</a>
            </div>
            <%
                        }
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                } else {
                    response.sendRedirect("loginSignup.jsp");
                }
            %>
        </div>

        <br>
        <span>Back to your home <a href="userHome.jsp">📩 Click here</a></span>
    </body>
     <script>
    function autoRefresh() {
        window.location = window.location.href;
    }
    setInterval('autoRefresh()', 5000);
</script>
</html>