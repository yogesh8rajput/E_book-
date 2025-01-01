<%-- 
    Document   : userSignup
    Created on : 10-Dec-2023, 2:19:21 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Signup Page</title>
   <style>
            a{
                text-decoration: none;
            }
            table{
                height: 500px;
                width: 400px;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <form action="sign" method="post">
            <h1>Sign up form</h1>
            <table border="2">
                 <tr>
                    <td>Enter the Name:-</td>
                    <td><input type="text" name="name"  placeholder="Enter your name"></td>
                </tr>
                <tr>
                    <td>Enter the Username:-</td>
                    <td><input type="text" name="uname" placeholder="Enter User name"></td>
                </tr>
                
                  <tr>
                    <td>Enter the Password:-</td>
                    <td><input type="password" name="pass" placeholder="Enter your password"></td>
                </tr>
                  <tr>
                    <td>Enter your gamil:-</td>
                    <td><input type="email" name="gmail" placeholder="Enter your gmail"></td>
                </tr>
                  <tr>
                    <td>Enter your Mobile No.:-</td>
                    <td><input type="long" name="mobile" placeholder="Enter your Mobile No."></td>
                </tr>
                  <tr>
                    <td>Enter Your Address:-</td>
                    <td><textarea id="id" name="add" rows="3" cols="20" placeholder="Enter your Address"></textarea></td>
                </tr>  
                   
                <tr>
                    <td> <input type="submit" value="ok"></td>
                     <td> <input type="reset" value="Reset"></td>
                    
                </tr>
                <tr>
                    <td colspan="2">If you are new User <a href="login.html">L😊gin</a> </td>
                    
                </tr>
                 
                 
            </table>
            
        </form>
    </body>
</html>
