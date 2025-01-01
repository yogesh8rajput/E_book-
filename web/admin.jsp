<%-- 
    Document   : admin
    Created on : 14-Dec-2023, 9:46:35 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
        <style>
            body{
                background: url("img/table (1).jpg");
                background-repeat: no-repeat;
                background-size: cover;
                text-align: center;
                color: white;
                font-size: 25px;
                margin-top: 40px;
            }
            h1
            {

                color: black;

                text-align: center;
                font-size: 40px;
            }

        </style>
    </head>
    <body>
        <div>
        </center><div>
            <h1>Login Page</h1>
            <form action="addminlogin" method="post">
                <label>Username:-</label>
                <input type="text" name="a_name"><br><br>
                <label>Password:-</label>
                <input type="password" name="a_pass"><br><br>
                <input type="submit" value="submit"> 
                <input type="reset" value="reset">

                <p align="center" color=""> <% out.print("Welcome  ");
                    %></p>
            </form>
        </div>
    </center>
</div>
<a href="adminout">Log out</a>


</body>
</html>
