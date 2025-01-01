<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    
         <%@include file="usernavbar.jsp"%>
    
  
    <!--<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">-->
    <style>
         
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color:rgba(0, 0, 0, 0.734);
                color: white;
                       
           
            height: 100vh;
        }
        .main_contain{
            height: 90%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .profile-container {
            background-color: black;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 500px;
            width: 100%;
            text-align: center;

        }
        h1 {
            margin: 0 0 20px;
            color: #007bff;
        }
        .profile-image {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            border: 4px solid #007bff;
            margin-bottom: 20px;
        }
        .grid-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            font-weight: bold;
            color: #007bff;
        }
        input[type="text"], input[type="email"], input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .button-container {
            margin-top: 20px;
            grid-column: span 2;
            text-align: center;
        }
        .submit-button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
            width: 100%;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
        .refresh-message {
            margin-top: 20px;
            color: red;
            font-size: 14px;
        }
        .navbar{
            /*position: absolute;*/
        }
    </style>
</head>
<body>
    <div class="main_contain">
    <div class="profile-container">
        <h1>Update Your Profile</h1>
        <%
            try {
                Connection con = Database_connection.getconnection();
                String UserId = request.getParameter("id");
                PreparedStatement pt = con.prepareStatement("select * from user where UserId=?");
                pt.setString(1, UserId);
                ResultSet rs = pt.executeQuery();

                if (rs.next()) {
        %>

        <form action="updateprofile" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= UserId %>">

            <div class="grid-form">
                <div>
                    <label>Name:</label>
                    <input type="text" name="name" value="<%= rs.getString("Name") %>" required>
                </div>
                <div>
                    <label>Email:</label>
                    <input type="email" name="email" value="<%= rs.getString("Gmail") %>" required>
                </div>
                <div>
                    <label>Mobile:</label>
                    <input type="text" name="mobile" value="<%= rs.getString("Mobile") %>" required>
                </div>
                <div>
                    <label>Address:</label>
                    <input type="text" name="address" value="<%= rs.getString("Address") %>" required>
                </div>
            </div>

            <div class="button-container">
                <input type="submit" class="submit-button" value="Update Information">
            </div>
        </form>

        <form action="updatepi" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
            <input type="hidden" name="id" value="<%= UserId %>">
            <img src="img2/<%= rs.getString("image_data") %>" class="profile-image" alt="Profile Image"/>
            <input type="file" name="pic" accept=".png,.jpg,.jpeg" required>
            <div class="button-container">
                <input type="submit" class="submit-button" value="Update Picture">
            </div>
        </form>

        <%
                } else {
                    out.print("<p>User not found!</p>");
                }
            } catch (Exception e) {
                out.print("<p class='refresh-message'>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
    </div>
</body>
</html>
