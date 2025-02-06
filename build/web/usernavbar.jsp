<%-- 
    Document   : usernavbar
    Created on : 04-Oct-2024, 10:45:54 pm
    Author     : yoges
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
                /*background: url("img/ind.jpg") no-repeat center center fixed;*/
                background-size: cover;
                font-family: Arial, sans-serif;
                margin-bottom: 3px;
            }
            #navbarr {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: rgba(0, 0, 0, 0.7);
/*                padding: 15px 20px;*/
            }
            .logo {
                font-size: 40px;
                color: wheat;
                font-weight: bold;
            }
            .navv {
                display: flex;
                gap: 15px;
            }
            .navv a {
                text-decoration: none;
                color: wheat;
                font-size: 18px;
                padding: 10px 15px;
                border-radius: 5%;
                transition: background-color 0.3s, color 0.3s;
            }
            .navv a:hover {
                background-color: wheat;
                color: black;
            }
            #welcome {
                text-align: center;
                margin-top: 160px;
                color: white;
                font-size: 30px;
            }
            .h1{
                color: green;
            }
            .logo img{
                height:  3rem;
                width: 3rem;
            }
        </style>
    </head>
    
        <div id="navbarr">
            <div class="logo"><img src="img/basket.png" alt="alt" width="50" height="100"/>E-BOOK</div>
            <div class="navv">
                <a href="userHome.jsp">UserHome</a>
                <a href="userBookDeatails.jsp">Book Details</a>
                <a href="profile.jsp">Profile</a>
                <!--<a href="index.html">Home</a>-->
                <a href="userlogout">Log out</a>
                <!--<a href="index.jsp"><img src="./img/ico.png" height="40" width="80" alt="Home Icon"></a>-->
            </div>
        </div>
     <script>
//    function autoRefresh() {
//        window.location = window.location.href;
//    }
//    setInterval('autoRefresh()', 50000);
</script>
    
</html>
