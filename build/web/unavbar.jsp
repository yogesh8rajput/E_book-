<%-- 
    Document   : edit
    Created on : 16-Dec-2023, 5:59:41 pm
    Author     : hp
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                /*background: url("work/wave-haikei.svg") no-repeat center center fixed;*/
                background-size: cover;
                font-family: Arial, sans-serif;
            }
            #navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: rgba(0, 0, 0, 0.7);
                padding: 15px 20px;
            }
            .logo {
                font-size: 40px;
                color: wheat;
                font-weight: bold;
            }
            .nav {
                display: flex;
                gap: 15px;
            }
            .nav a {
                text-decoration: none;
                color: wheat;
                font-size: 18px;
                padding: 10px 15px;
                border-radius: 5%;
                transition: background-color 0.3s, color 0.3s;
            }
            .nav a:hover {
                background-color: white;
                color: black;
            }
            #welcome {
                text-align: center;
                margin-top: 160px;
                color: white;
                font-size: 30px;
            }
            #home img{

                height: 70vh;


            }
            #home2 img{

                height: 69.5vh;


            }
            #home{
                display: flex;
                flex: 1;
            }
            #home2{
                display: flex;
                flex: 1;
            }
            #homemain{
                display: flex;
            }
            h1{
                color: wheat;
            }
      

        </style>
    </head>
    <body>
        <div id="navbar">
            <div class="logo"> <img src="img/basket.png" alt="alt" width="50"/>E-BOOK</div>
             <!--<h1>Welcome the E-Book Library</h1>-->
            <div class="nav">
                <a href="index.html">Home</a><br><br>
                <a href="loginSignup.jsp">Login</a><br><br>
               
                <a href="contact.jsp">Contact us </a><br><br>

            </div>

        </div>
        

</body>
</html>




</body>
</html>
