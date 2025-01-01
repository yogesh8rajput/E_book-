<%-- 
    Document   : order
    Created on : 02-Jan-2024, 4:08:52 pm
    Author     : hp
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <th>Quantity</th>
            <th>Total  Quantity</th>
            <th>Purchase</th>
            <th>Price</th>
            <th>Calculate</th>
            <th>Action  </th>
        </tr>
        <%
            for (i = 0; i <= (Integer)session.getAttribute("count"); i++) {
               ArrayList viw=(ArrayList)session.getAttribute(""+i);
               Iterator itr=viw.iterator();
                {
                    int p = 0;
        %>
        <tr> 
            <%
                while (itr.hasNext()) {
            %>
            <td id=<%=i + "" + p%>><%=(String) itr.next()%> </td>
            <%
                    p++;
                }
            %>
            <td><input type="text" id="qty(<%=i%>)" name="pur"></td>
            <td><label id="total<%=i%>"></label></td>
            <td><input type="button" value="Calculate" onclick="qua<%=i%>"></td>
        </tr>
        <%
                    }
                }
            } else {
                response.sendRedirect("userlogin.jsp");
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
