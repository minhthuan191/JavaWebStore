<%--
    Document   : product
    Created on : Oct 5, 2021, 4:25:31 PM
    Author     : USER
--%>

<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.user.UserDTO"%>
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
        <title>Product manager Page</title>
        <style>
            .table-wrapper{
                overflow-x: auto;
                max-width:  100vw;
            }
            input.update-btn{
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
                    </ul>
                </div>
            </div>
        </nav>
        <button class="btn btn-primary"><a href="MainController?action=NewProduct">New product</a></button>
        <%
            List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (!listProduct.isEmpty()) {
        %>
        <div class="table-wrapper">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Product ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Category ID</th>
                        <th scope="col">Description</th>
                        <th scope="col">Image</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Status ID</th>
                        <th scope="col">Expiration date</th>
                        <th scope="col">Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (ProductDTO product : listProduct) {
                    %>
                <form action ="MainController">
                    <tr>
                        <th scope="row"><%= count++%></th>
                        <td><%= product.getProductID()%></td>
                        <td><input type="text" name="name" value="<%= product.getName()%>" required=""/></td>
                        <td><%= product.getCategoryID()%></td>
                        <td><input type="text" name="descr" value="<%= product.getDescr()%>" required=""/></td>
                        <td><img src="<%= product.img%>" style="width: 80px; height: 80px"/> </td>
                        <td><input type="text" name="quantity" value="<%= product.getQuantity()%>" required=""/></td>
                        <td><input type="text" name="price" value="<%= product.getPrice()%>" required=""/></td>
                        <td><input type="text" name="statusID" value="<%= product.getStatusID()%>" required=""/></td>
                        <td><input type="text" name="expiration" value="<%= product.getExpiration()%>" required=""/></td>
                        <td>
                            <input type="submit" name="action" value="UpdateProduct" class="update-btn"/>

                            <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                            <input type="hidden" name="categoryID" value="<%= product.getCategoryID()%>"/>
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

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
