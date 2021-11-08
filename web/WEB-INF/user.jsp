<%-- 
    Document   : user
    Created on : Sep 23, 2021, 11:16:25 AM
    Author     : USER
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1> User</h1>
        <%
            UserDTO loginUser=(UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <h1>Welcome: <%= loginUser.getName()%></h1>
        <input type="submit" name="action" value="Home"/>
    </body>
</html>
