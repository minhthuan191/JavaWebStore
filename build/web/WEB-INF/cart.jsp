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
        <title>Cart</title>
    </head>
    <body>
        <h1>Your cart</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if(cart != null)
            {

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                int count = 1;
                int total = 0;
                for(CartItem cartItem : cart.getCart().values()){
                    total += cartItem.getProduct().getPrice()*cartItem.getQuantity();
                
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <input type="hidden" name="productID" value="<%= cartItem.getProduct().getProductID()%>"/>
                    <td><%= cartItem.getProduct().getName()%></td>
                    <td><%= cartItem.getProduct().getPrice()%> vnd</td>
                    <td><input type="number" name="quantity" value="<%= cartItem.getQuantity() %>" required=""</td>
                    <td><%= cartItem.getProduct().getPrice()*cartItem.getQuantity()%> vnd</td>
                    
                    <td>
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                    
                    <td>
                        <input type="submit" name="action" value="Edit"/>
                    </td>
                    
                </tr>
                
            </form>
                <%
                }
                %>
            </tbody>
        </table>
            <h1>Total : <%= total%> vnd</h1>
            
        <%
            }
        %>
        <button><a href="MainController?action=CheckOut">Order</a></button>
        <button><a href="MainController?action=Home">Add more</a></button>
    </body>
</html>
