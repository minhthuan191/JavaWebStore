<%--
    Document   : order
    Created on : Oct 17, 2021, 5:49:49 PM
    Author     : USER
--%>

<%@page import="sample.order.OrderDTO"%>
<%@page import="java.util.List"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Order Page</title>
        <style>
            input.detail-btn{
                color: white;
                background-color: green;
                border-radius: 5px;
                outline: none;
            }
            a{
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="MainController?action=Search&search=">User</a>
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
                </div>
            </div>
        </nav>
        <%
            List<OrderDTO> listOrder = (List<OrderDTO>) request.getAttribute("LIST_ORDER");
            if (listOrder != null)
                if (!listOrder.isEmpty()) {


        %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Order ID</th>
                    <th scope="col">User ID</th>
                    <th scope="col">Date</th>
                    <th scope="col">Total</th>
                    <th scope="col">Detail</th>
                </tr>
            </thead>
            <tbody>
                <%                    int count = 1;
                    for (OrderDTO order : listOrder) {

                %>
            <form action="MainController">
                <tr>
                    <th scope="row"><%= count++%></th>
                    <td><%= order.orderID%></td>
                    <td><%= order.userID%></td>
                    <td><%= order.date%></td>
                    <td><%= order.total%></td>
                    <td>
                        <input type="submit" name="action" value="ViewDetail" class="detail-btn">
                        <input type="hidden" name="orderID" value="<%= order.orderID%>">
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>

    <%
            }
    %>
</body>
</html>
