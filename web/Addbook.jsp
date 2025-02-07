<%-- 
    Document   : Addbook
    Created on : 09-Dec-2023, 11:05:27 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book Page</title>
    <style>
        body{
                background: url("work/adminhome.svg");
                /*background-repeat: no-repeat;*/
                /*background-size: 100px;*/
                text-decoration: none;
                background-color: #00BFA6;
                text-align: center;

                color: black;

            }
            a{
                text-decoration: none;
                color: orange;

            }
            span{
                padding: 0;
                margin: 0;
            }
            p{
                font-size: 50px;
            }


        h1 {
            margin: 20px 0;
        }

        form {
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            padding: 10px;
            display: inline-block;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            margin-top: 2rem;
        }

        label {
            font-size: 20px;
            display: block;
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="file"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }

        a {
            color: #FFD700;
            text-decoration: none;
            margin-top: 10px;
            display: inline-block;
            transition: color 0.3s;
        }
        p{
            color: black;
        }
        a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <span> <%@include file="adminnavbar.jsp"%></span>
    <p>
         <%
        String st = (String) session.getAttribute("user");

            out.print("Welcome  " + st);
            if (st != null) {

        %> 
    </p>
        <!--<h1>Welcome, <%= st%>!</h1>-->
        
  

    <form action="addbook" method="post" enctype="multipart/form-data">
       
        <input type="hidden" name="book_id" id="book_id" placeholder="Enter Book ID" required>

        <label for="book_name">Book Name</label>
        <input type="text" name="book_name" id="book_name" placeholder="Enter Book Name" required>

        <label for="auther">Author</label>
        <input type="text" name="auther" id="auther" placeholder="Enter Book Author" required>

        <label for="quantity">Quantity</label>
        <input type="text" name="quantity" id="quantity" placeholder="Enter Book Quantity" required>

        <label for="price">Price</label>
        <input type="text" name="price" id="price" placeholder="Enter Book Price" required>

        <label for="pic">Upload Image</label>
        <input type="file" name="pic" id="pic" accept=".png,.jpg,.jpeg" required>

        <input type="submit" value="Submit">
        <input type="reset" value="Clear">
        <br>
        <span>Back to your home <a href="adminhome.jsp">Click here</a></span>
    </form>
    
    
    
    <%
        }else {
                    response.sendRedirect("adminlogin.jsp");
                }
            %>
<!--         <script>
    function autoRefresh() {
        window.location = window.location.href;
    }
    setInterval('autoRefresh()', 5000);
</script>-->
</body>
</html>
