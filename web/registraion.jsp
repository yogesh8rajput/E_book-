<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
             background-color:rgba(0, 0, 0, 0.734);
                color: white;
        }
       
        .contact-form {
            color: black;
            
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            padding: 40px;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }
        .avatar {
            position: absolute;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            overflow: hidden;
            top: calc(-80px / 2);
            left: calc(50% - 40px);
        }
        .contact-form h2 {
            margin: 0 0 20px;
            color: #fff;
            text-align: center;
            text-transform: uppercase;
        }
        .contact-form p {
            margin: 0;
            padding: 0;
            font-weight: bold;
            color: #fff;
        }
        .grid-container {
            display: grid;
            grid-template-columns: 1fr 1fr; /* Two columns */
            gap: 10px; /* Space between columns */
        }
        .contact-form input {
            width: 100%;
            margin-bottom: 10px;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
        }
        .contact-form input[type=submit] {
            height: 40px;
            color: #fff;
            font-size: 15px;
            background: blue;
            cursor: pointer;
            border-radius: 25px;
            border: none;
            outline: none;
            margin-top: 20px;
        }
        .contact-form a {
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
        }
        input[type=checkbox] {
            width: 10%;
        }
        span {
            color: red;
            align-items: center;
            margin-left: 70px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="contact-form">
        <img alt="" class="avatar" src="img/user.jpeg">
        <% String invi = request.getParameter("inavalid");
           if (invi != null && invi.equals("USER")) {
        %>
        <span>Please enter a valid username</span>
        <%
           }
        %>
        <form action="userSignin" method="post" enctype="multipart/form-data">
            <h2>Register</h2>
            <div class="grid-container">
                <div>
                    <p>Name</p>
                    <input placeholder="Enter Your Name" name="name" type="text" required>
                </div>
                <div>
                    <p>Username</p>
                    <input placeholder="Enter Username" name="uname" type="text" required>
                </div>
                <div>
                    <p>Password</p>
                    <input placeholder="Enter Password" name="pass" type="password" required>
                </div>
                <div>
                    <p>Email</p>
                    <input placeholder="Enter Email" type="email" name="gmail" required>
                </div>
                <div>
                    <p>Mobile</p>
                    <input type="text" name="mobile" placeholder="Enter your Mobile No." required>
                </div>
                <div>
                    <p>Address</p>
                    <input placeholder="Enter Address" type="text" required>
                </div>
            </div>
            <p>Upload Photo</p>
            <input type="file" name="pic" accept=".png,.jpg,.jpeg" required>
            <input type="submit" value="Register">
            <p><input type="checkbox"> Remember Me</p>
        </form>
    </div>

</body>
</html>
