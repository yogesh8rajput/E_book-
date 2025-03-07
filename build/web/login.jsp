<%-- 
    Document   : login
    Created on : 28-Sept-2024, 10:57:08 am
    Author     : yoges
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                height: 100vh;
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
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
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
         <%@include file="unavbar.jsp"%>
        <div class="container">
            <form class="login-form" action="userlogin.jsp">
                <h2>Login</h2>
                <div class="input-group">
                    <label >Username</label>
                    <input type="text" name="na" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" name="pw" id="password" required>
                </div>
                <button type="submit">Login</button>
                <div class="footer">

                    <p>Don't have an account? <a href="loginSignup.jsp">Sign up</a></p><br>
                    <p>Do u know password? <a href="forget.jsp">Forget </a></p>
                </div>
            </form>
        </div>
    </body>
</html>
