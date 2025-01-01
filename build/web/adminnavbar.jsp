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
            /*background: url("img/ind.jpg") no-repeat center center fixed;*/
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
            color: white;
            font-weight: bold;
        }
        .nav {
            display: flex;
            gap: 15px;
        }
        .nav a {
            text-decoration: none;
            color: white;
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
      
    </style>
</head>
<body>
    <div id="navbar">
        <div class="logo">E-BOOK</div>
        <div class="nav">
            <a href="Addbook.jsp">Add Book</a>
            <!--<a href="showfeedback.jsp">Feedback</a>-->
            <a href="bookmanagement.jsp">Book Management</a>
            <a href="showalluser.jsp">Show All Data</a>
            <a href="adminlogout">Log Out</a>
            <a href="index.html"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"/><path d="M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg></a>
        </div>
    </div>
    
    
</body>
</html>
