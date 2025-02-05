<%@page import="java.sql.ResultSet"%>
<%@page import="Universal_connection.Database_connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="icon" href="img/basket.webp"/>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h1 {
            margin: 0 0 20px;
            color: #007bff;
        }
        .profile-image {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 4px solid #007bff;
            margin-bottom: 20px;
        }
        .profile-info {
            margin-bottom: 15px;
            text-align: left;
        }
        .profile-info label {
            font-weight: bold;
            color: #007bff;
        }
        .button-container {
            margin-top: 20px;
        }
        .edit-button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .edit-button:hover {
            background-color: #0056b3;
        }
        .refresh-message {
            margin-top: 20px;
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <h1>Welcome to The E-Book</h1>
        <h2>
            <% 
            String st = (String) session.getAttribute("USER");
            if (st != null) {
                try {
                    Connection con = Database_connection.getconnection();
                    PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE Username=?");
                    pst.setString(1, st);
                    ResultSet rs = pst.executeQuery();
                    if (rs.next()) {
            %>
                    <img src="img2/<%= rs.getString("image_data") %>" class="profile-image" alt="Profile Image"/>
                    <div class="profile-info">
                        <label>Name:</label> <%= rs.getString("Name") %>
                    </div>
                    <div class="profile-info">
                        <label>Username:</label> <%= rs.getString("Username") %>
                    </div>
                    <div class="profile-info">
                        <label>Email:</label> <%= rs.getString("Gmail") %>
                    </div>
                    <div class="profile-info">
                        <label>Mobile:</label> <%= rs.getString("Mobile") %>
                    </div>
                    <div class="profile-info">
                        <label>Address:</label> <%= rs.getString("Address") %>
                    </div>
                    <div class="button-container">
                        <button class="edit-button" onclick="location.href='editProfile.jsp'">Edit Profile</button>
                    </div>
            <% 
                    } else {
                        out.print("User not found.");
                    }
                } catch (Exception ex) {
                    out.print("Error: " + ex.getMessage());
                }
            } else {
                response.sendRedirect("login.html");
            }
            %>
        </h2>
        <div class="refresh-message">This page refreshes every 5 seconds.</div>
    </div>

    <script>
        setInterval(function() {
            window.location.reload();
        }, 5000);
    </script>

</body>
</html>
