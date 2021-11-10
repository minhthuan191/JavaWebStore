<%--
    Document   : admin
    Created on : Sep 23, 2021, 11:19:47 AM
    Author     : USER
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <style>
            input.update-btn{
                color: white;
                background-color: green;
                border-radius: 5px;
                outline: none;
            }
            a{
                text-decoration: none;
                color: white;
                background-color: transparent;
                text-decoration: none;
            }
            a:hover{
                color: #f7f5b5;
            }
        </style>



    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String a = loginUser.getRoleID();
            if (loginUser == null || !"AD".equals(a)) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">User</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?action=Product">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?action=Category">Category</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?action=Order">Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="MainController?action=Logout">Logout</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="text" name="search" value="<%= search%>" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit" name ="action" value="Search">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (!listUser.isEmpty()) {
        %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">User ID</th>
                    <th scope="col">Password</th>
                    <th scope="col">Name</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Status ID</th>
                    <th scope="col">Role ID</th>
                    <th scope="col">Delete</th>
                    <th scope="col">Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action ="MainController">
                <tr>
                    <th scope="row"><%= count++%></th>
                    <td><%= user.getUserID()%></td>
                    <td><%= user.getPassword()%></td>
                    <td><input type="text" name="name" value="<%= user.getName()%>" required=""/></td>
                    <td><input type="text" name="address" value="<%= user.getAddress()%>" required=""/></td>
                    <td><input type="text" name="phone" value="<%= user.getPhone()%>" required=""/></td>
                    <td><input type="text" name="statusID" value="<%= user.getStatusID()%>" required=""/></td>
                    <td><input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/></td>
                    <td>
                        <button class="btn btn-danger"><a href="MainController?userID=<%= user.getUserID()%>&action=Delete&search=<%=search%>">Delete</a></button>
                    </td>
                    <td>
                        <button type="submit" name="action" value="Update" class="btn btn-success">Update</button>
                        <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                        <input type="hidden" name="search" value="<%= search%>" />
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%=error%>
    <%
            }
        }
    %>
</body>

</html>
