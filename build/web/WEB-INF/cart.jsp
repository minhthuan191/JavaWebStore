<%--
    Document   : cart
    Created on : Oct 17, 2021, 1:21:15 PM
    Author     : USER
--%>

<%@page import="sample.cart.CartItem"%>
<%@page import="sample.cart.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Cart</title>
        <style>
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
        <h1>Your cart</h1>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {

        %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Delete</th>
                    <th scope="col">Update</th>
                </tr>
            </thead>
            <tbody>
                <%                    int count = 1;
                    int total = 0;
                    for (CartItem cartItem : cart.getCart().values()) {
                        total += cartItem.getProduct().getPrice() * cartItem.getQuantity();

                %>
            <form action="MainController" method="POST">
                <tr>
                    <th scope="row"><%= count++%></th>
                <input type="hidden" name="productID" value="<%= cartItem.getProduct().getProductID()%>"/>
                <td><%= cartItem.getProduct().getName()%></td>
                <td><%= cartItem.getProduct().getPrice()%> vnd</td>
                <td><input type="number" name="quantity" value="<%= cartItem.getQuantity()%>" required=""</td>
                <td><%= cartItem.getProduct().getPrice() * cartItem.getQuantity()%> vnd</td>

                <td>
                    <button class="btn btn-danger" type="submit" name="action" value="Remove">Remove</button>
                </td>

                <td>
                    <button class="btn btn-secondary" type="submit" name="action" value="Edit">Edit</button>
                </td>

                </tr>

            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <h2>Total : <%= total%> vnd</h2>

    <%
        }
    %>
    <button class="btn btn-success"><a href="MainController?action=CheckOut">Order</a></button>
    <button class="btn btn-primary"><a href="MainController?action=Home">Add more</a></button>
</body>
</html>
