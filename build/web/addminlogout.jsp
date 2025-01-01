<%-- 
    Document   : addminlogout
    Created on : 10-Dec-2023, 4:40:21 pm
    Author     : hp
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Logout</title>
    </head>
    <body>
        <%
            
        PrintWriter pt=response.getWriter();
        response.setContentType("text/html");
        pt.print("");
        RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");
        rd.include(request, response);
       
        Cookie ck[]=request.getCookies();
        
        if(ck!=null)
        {
             pt.print("Profile page yes");
        pt.print("Welcome"+ck[0].getValue());
        rd=request.getRequestDispatcher("a.html");
        rd.forward(request, response);
        
        }
        else
        {
        pt.print("Firstly you in login");
        rd=request.getRequestDispatcher("adminlogin.jsp");
        rd.include(request, response);
        }
        
    
       
        %>
    </body>
</html>
