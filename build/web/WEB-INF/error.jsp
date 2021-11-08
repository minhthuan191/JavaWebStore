<%-- 
    Document   : error
    Created on : Sep 23, 2021, 11:15:57 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Hello error !<%= session.getAttribute("ERROR_MESSAGE") %></h1>
    </body>
</html>
