<%-- 
    Document   : loginSignup
    Created on : 14-Oct-2024, 9:32:31 pm
    Author     : yoges
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login & Signup</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                text-decoration: none;
            }

            body {
                font-family: 'Arial', sans-serif;
                background-color: rgba(0, 0, 0, 0.734);
                color: white;
/*                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;*/
                perspective: 1000px;
            }

            .container {
                width: 400px;
                position: relative;
                height: 560px;
                transition: transform 0.6s;
                transform-style: preserve-3d;
/*                display: flex;
                justify-content: center;
                align-items: center;*/
               
            }


            /*        .containerr {
                        width: 400px;
                        position: relative;
                        height: 500px;
                        transition: transform 0.6s;
                        transform-style: preserve-3d;
                    }*/


            .form {
                position: absolute;
                width: 100%;
                height: 100%;
                backface-visibility: hidden;
                border-radius: 8px;
                padding: 2rem;
                background: black;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .form h2 {
                margin-bottom: 1rem;
                text-align: center;
            }

            .input-group {
                margin-bottom: 1.5rem;
                display: flex;
                flex-direction: column;
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

            .signup-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 1rem;
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
                text-decoration: none;
            }

            .footer a {
                color: #007bff;
                /*text-decoration: none;*/
            }

            .footer a:hover {
                text-decoration: underline;
            }

            .form-back {
                transform: rotateY(180deg);
            }
            span{
                color: green;
                text-align: center;
                /*            margin-left: */
                /*margin-left: 3rem;*/
                font-weight: bold;

            }
            .s{
                color: red;
                font-weight: bold;
            }
            .main{
                 display: flex;
                justify-content: center;
                align-items: center;
                height: 80vh;
                /*margin-bottom: 2rem;*/
            }

        </style>
    </head>
    <body>
        <%@include file="unavbar.jsp"%>
       
        <div class="main">
            
       
        <div class="container" id="container">
            <!-- Login Form -->
            <!-- <form action="log" method="post"> -->
            <!--<div>-->
            <form action="userlogin.jsp"method="post" class="form" id="login-form">    
                <h2>Login</h2>
               <% String nvi = request.getParameter("valid");
                    if (nvi != null && nvi.equals("USER")) {
                %>
                <span>Success</span>
                <%
                    }
                %>     <% String invi = request.getParameter("inavalid");
                    if (invi != null && invi.equals("USER")) {
                %>
                <span class="s">Please enter a valid username</span>
                <%
                    }
                %>    
                <div class="input-group">
                    <label for="login-username">Username</label>
                    <input type="text" name="na" id="login-username" required>
                </div>
                
                <div class="input-group">
                    <label for="login-password">Password</label>
                    <input type="password" name="pw" id="login-password" required>
                </div>
                <button type="submit" onclick="submitLogin()">Login</button>
                <br><br>
                <div class="footer">
                    <p>Don't have an account? <a href="#" onclick="flipForms()">Sign up</a></p>

                    <br>
                    <p>Forgot password? <a href="forget.jsp">Forget</a></p>
                </div>
            </form>


            <!-- Signup Form -->

            <form action="userSignin" method="post" enctype="multipart/form-data" class="form form-back" id="signup-form">


                <h2>Sign Up</h2>
                <div class="signup-grid">
                    <div class="input-group">


                        <label for="signup-name">Name</label>
                        <input type="text" name="name" id="signup-name" required>
                    </div>
                    <div class="input-group">
                        <label for="signup-username">Username</label>
                        <input type="text" name="uname" id="signup-username" required>
                    </div>
                    <div class="input-group">
                        <label for="signup-password">Password</label>
                        <input type="password" name="pass" id="signup-password" required>
                    </div>
                    <div class="input-group">
                        <label for="signup-email">Email</label>
                        <input type="email" name="gmail" id="signup-email" required>
                    </div>
                    <div class="input-group">
                        <label for="signup-mobile">Mobile</label>
                        <input type="text" name="mobile" id="signup-mobile" required>
                    </div>
                    <div class="input-group">
                        <label for="signup-address">Address</label>
                        <input type="text" name="add" id="signup-address" required>
                    </div>
                    <!--                     <div class="input-group">
                                            <label for="signup-address">Pincode</label>
                                            <input type="text" id="signup-address" required>
                                        </div>-->
                    <div class="input-group">
                        <label for="signup-photo">Photo</label>
                        <input type="file" name="pic" id="signup-photo" accept=".png,.jpg,.jpeg" required>
                    </div>
                </div>
                <button type="submit">Sign Up</button>
                <div class="footer">
                    <p>Already have an account? <a href="login.jsp" onclick="flipForms()">Login</a></p>
                </div>

            </form> 
        </div>
 </div>
        <script>
            function flipForms() {
                const container = document.getElementById('container');
//                const login = document.getElementById('form');
              container.style.height="580px";
               container.style.width="450px";
                
               container.classList.toggle('form-back');
//              
            }
             const container = document.getElementById('container');
//                const login = document.getElementById('form');
              container.style.height="400px";
               container.style.width="300px";

            //        function submitLogin() {
            //            alert("Login submitted");
            //        }
            //
            //        function submitSignup() {
            //            alert("Signup submitted");
            //        }
        </script>
    </body>
</html>

