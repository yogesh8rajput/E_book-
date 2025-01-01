<%-- 
    Document   : adminlogin
    Created on : 09-Dec-2023, 2:35:36 pm
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Admin Login</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Arial', sans-serif;
                background-color:rgba(0, 0, 0, 0.734);
                color: white;

                /*background-image:url("img/sky.png");*/
                display: flex;
                justify-content: center;
                align-items: center;
                height: 110vh;
            }

            .container {

                background: black;
                color: #f4f4f4;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }

            .login-form h2 {
                margin-bottom: 1rem;
                text-align: center;
            }

            .input-group {
                margin-bottom: 1.5rem;
            }

            .input-group label {
                display: block;
                margin-bottom: 0.5rem;
            }

            .input-group input {
                width: 100%;
                padding: 0.5rem;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .input-group input:focus {
                border-color: #007bff;
                outline: none;
            }

            button {
                width: 100%;
                padding: 0.7rem;
                /*background-color: #007bff;*/
                background-color: green;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                   /*background-color: green;*/
                background-color: #0056b3;
            }

            .footer {
                text-align: center;
                margin-top: 1rem;
            }

            .footer a {
                color: #007bff;
                text-decoration: none;
            }

            .footer a:hover {
                text-decoration: underline;
            }

        </style>

    </head>
    <body>
<!--        ----admin----->
      
         <div class="container">
            <form class="login-form" action="adminlogin.jsp">
                <h2>Admin</h2>
                <div class="input-group">
                    <label >Username</label>
                    <input type="text" name="a_name" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" name="a_pass" id="password" required>
                </div>
                <button type="submit">Login</button>
                <div class="footer">

                    <!--<p>Don't have an account? <a href="registraion.jsp">Sign up</a></p><br>-->
                    <p>Do u know password? <a href="forget.jsp">Forget </a></p>
                </div>
            </form>
        
             
        
<!--       <div>
        </center><div>
            <h1>Admin 📚</h1>
            <form 
                <label>Username:-</label>
                <input type="text" name="a_name"><br><br>
                <label>Password:-</label>
                <input type="password" name="a_pass"><br><br>
                <input type="submit" <img src="img/login.jpg" alt="alt"/>   
                <input type="reset" value="reset">


            </form>
        </div>
    </center>
    <br>
</div>
<a href="adminout"><img src="img/logout.jpg" alt="alt"/></a>-->

<%

    try {

        Connection con=Database_connection.getconnection();
        PreparedStatement pt = con.prepareStatement("select* from admin where Name=? and Password=?");
        String uname = request.getParameter("a_name");
        String pass = request.getParameter("a_pass");
        pt.setString(1, uname);
        pt.setString(2, pass);
        ResultSet rs = pt.executeQuery();
        if (rs.isBeforeFirst()) {
            session.setAttribute("user", uname);
//            RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
response.sendRedirect("adminhome.jsp");
//            rd.forward(request, response);

        } else {

            // out.print("wrong Enter name and password");
        }
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>


</body>
</html>