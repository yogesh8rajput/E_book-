<%-- 
    Document   : o
    Created on : 06-Jan-2024, 12:12:36 pm
    Author     : hp
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>order Page</title>

        <style>
            body{
                background: url("img/tab.webp");
                background-repeat: no-repeat;
                background-size: cover;
                text-align: center;

                font-size: 25px;
                margin-top: 70px;
            }
            table{
                text-align: center;
                margin-left: 200px;
            }

        </style>
    </head>
    <body>
        <h1>Order list</h1>
        <%
            int i = 0;
            String st = (String) session.getAttribute("USER");

            out.print("Welcome  " + st);
            if (st != null) {
        %>
    <from> 
        <input type="hidden" value=""<%out.print(st);%>>
    </from>
    <table border="1" color="blue">
        <tr>
            <th>Book_Id</th>
            <th>Book_Name</th>
            <th>Author</th>

            <th>Book Price</th>
            <th>Quantity</th>
            <th>Purchase</th>
            <th>Price</th>
            <th>Calculate</th>
            <th>Action  </th>
        </tr>
        <%      for (i = 1; i <= (Integer) session.getAttribute("count"); i++) {
                ArrayList str1 = (ArrayList) session.getAttribute("" + i);
                Iterator itr = str1.iterator();
                {
                    int p = 0;
        %>
        <tr>
            <%
                while (itr.hasNext()) {
            %>
            <td id=<%=i + "" + p%>><%=(String) itr.next()%></td>
            <%
                    p++;
                }
            %>
            <td><input type="text" id="qua<%=i%>" name="pur"></td>
            <td><label id="total<%=i%>" ></label></td>
            <td><input type="button" value="Calculate" onclick="qty(<%=i%>)" ></td>
        </tr>
        <%
                    }
                }
            } else {
                response.sendRedirect("loginSignup.jsp");
            }
        %>
    </table>
    <input type="button" onclick="total(<%=i%>)" value="Total">
    <div id="tot"></div>


</body>
<script>
    function qty(k)
    {
        var price = parseInt(document.getElementById(k + "3").innerHTML);
        var qua = parseInt(document.getElementById("qua" + k).value);
        document.getElementById("total" + k).innerHTML = price * qua;
    }
    function  total(t)
    {
        var sum = o;
        for (j = 1; j < t; j++)
        {
            sum = sum + parseInt(document.getElementById("total" + j).innerHTML);
        }
        document.getElementById("tot").innerHTML = sum;

    }


</script>

</html>
