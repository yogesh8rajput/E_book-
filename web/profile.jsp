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
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                background-color:rgba(0, 0, 0, 0.734);
                color: black;
                /*            background: linear-gradient(to right, #4facfe, #00f2fe);
                            color: #333;*/

               
                /*height: 100vh;*/
            }
            .main-contain{
                 display: flex;
                justify-content: center;
                align-items: center;
                height: 90vh;
            }
            .profile-container {
                background-color:white;
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
            .edit-button, .update-button {
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 15px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
            }
            .edit-button:hover, .update-button:hover {
                background-color: #0056b3;
            }
            .refresh-message {
                margin-top: 20px;
                color: red;
                font-size: 14px;
            }
            .update-form {
                display: none;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
      <%@include file="usernavbar.jsp"%>
      <div class="main-contain">
        <div class="profile-container">
            <h1>Welcome to the 
                <br> <br>E-Book</h1>
            <h2>
                <%
                    String st = (String) session.getAttribute("USER");
                    if (st != null) {
                        try {
                            Connection con = Database_connection.getconnection();
                            PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE Username=?");
                            pst.setString(1, st);
                            ResultSet rs = pst.executeQuery();
                            while (rs.next()) {
                %>
                <img src="img2/<%= rs.getString("image_data")%>" class="profile-image" alt="Profile Image"/>
                <div class="profile-info">

                    <label>Name:</label> <%= rs.getString("Name")%>
                </div>
                <div class="profile-info">
                    <label>Username:</label> <%= rs.getString("Username")%>
                </div>
                <div class="profile-info">
                    <label>Email:</label> <%= rs.getString("Gmail")%>
                </div>
                <div class="profile-info">
                    <label>Mobile:</label> <%= rs.getString("Mobile")%>
                </div>
                <div class="profile-info">
                    <label>Address:</label> <%= rs.getString("Address")%>
                </div>
                <div class="button-container">
                    <a href="updateProfile.jsp?id=<%= rs.getString("UserId")%>">Edit Profile</a>
                </div>

                <div class="update-form" id="updateForm">
                    <h3>Update Your Information</h3>
                    <form action="updateprofile" method="post" enctype="multipart/form-data">

                        <label>id:</label> 
                        <input value= "<%= rs.getString("UserId")%>">
                        <label for="name">Name:</label>
                        <input type="text" name="name" value="<%= rs.getString("Name")%>" ><br>
                        <label for="email">Email:</label>
                        <input type="email" name="email" value="<%= rs.getString("Gmail")%>"><br>
                        <label for="mobile">Mobile:</label>
                        <input type="text" name="mobile" value="<%= rs.getString("Mobile")%>" ><br>
                        <label for="address">Address:</label>
                        <input type="text" name="address" value="<%= rs.getString("Address")%>" ><br>

                        <input type="file" name="pic" accept=".png,.jpg,.jpeg" value="<%=rs.getString("image_data")%>">
                        <input value="Submit" type="submit">
                        <input value="Clear" type="reset"><br><br>
                    </form>
                </div>
                <%
                            }
                        } catch (Exception ex) {
                            out.print("Error: " + ex.getMessage());
                        }
                    } else {
                        response.sendRedirect("loginSignup.jsp");
                    }
                %>
            </h2>
            <div class="refresh-message"></div>
        </div>
      </div>

        <script>
            function showUpdateForm() {
                document.getElementById("updateForm").style.display = "block";
            }

    //        setInterval(function() {
    //            window.location.reload();
    //        }, 5000);
        </script>

    </body>
</html>
