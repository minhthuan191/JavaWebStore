<%--
    Document   : viewProduct
    Created on : Oct 13, 2021, 2:46:30 PM
    Author     : USER
--%>

<%@page import="sample.product.ProductDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="sample.product.ProductDTO"%>
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
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>View Page</title>
        <style>
            a{
                text-decoration: none;
                color: white;
                background-color: transparent;
                text-decoration: none;
            }
            a:hover{
                color: #f7f5b5;
            }
            .row-cols-md-4{
                margin: 0 50px 0 50px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="MainController?action=Logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
        <div class="row row-cols-1 row-cols-md-4 g-4">
            <%
                ProductDAO dao = new ProductDAO();
                List<ProductDTO> listProduct = dao.getListProduct();

                for (int i = listProduct.size() - 1; i >= 0; i--) {
                    if (listProduct.get(i).statusID == "1") {
                        listProduct.remove(i);
                    }
                }

                if (listProduct != null) {
                    if (!listProduct.isEmpty()) {
            %>
            <%
                int count = 1;
                for (ProductDTO product : listProduct) {
            %>
            <form action ="MainController">
                <div class="col">
                    <div class="card">
                        <img src="<%= product.getImg()%>" class="card-img-top" style="width: auto ; height: 240px;" >
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p class="card-text"><%= product.getDescr()%></p>
                            <p class="card-text"><%= product.getPrice()%> VND</p>
                            <button class="btn btn-primary"><a href="MainController?action=AddToCart&productID=<%=product.getProductID()%>&quantity=1">Add</a></button>
                        </div>
                    </div>
                </div>
            </form>
            <%
                }
            %>
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
