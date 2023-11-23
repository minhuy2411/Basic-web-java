<%-- 
    Document   : CheckOut
    Created on : Jul 12, 2023, 8:14:52 PM
    Author     : ☢ minhuy ☣
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String msg = (String) request.getAttribute("msg");
                if (msg != null)%><h1><%= msg %></h1><%
        %>
    </body>
</html>
