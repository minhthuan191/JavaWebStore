<%-- 
    Document   : orderDetail
    Created on : Oct 23, 2021, 1:58:26 PM
    Author     : USER
--%>

<%@page import="sample.orderDetail.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail Page</title>
    </head>
    <body>
         <%
            List<OrderDetailDTO> listOrderDetail =(List<OrderDetailDTO>) request.getAttribute("LIST_ORDER_DETAIL");
            if(listOrderDetail != null)
                if(!listOrderDetail.isEmpty()){
                    
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Order Detail ID</th>
                    <th>Order ID</th>
                    <th>Product ID</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                 <%
                        int count = 1;
                        for(OrderDetailDTO orderDetail : listOrderDetail){
                    %>
                <tr>
                   
                    <td><%= count++ %></td>
                    <td><%= orderDetail.orderDetailID %></td>
                    <td><%= orderDetail.orderID %></td>
                    <td><%= orderDetail.productID %></td>
                    <td><%= orderDetail.quantity %></td>
                    <td><%= orderDetail.price %></td>
                    <td><%= orderDetail.price * orderDetail.quantity %></td>
                   
                </tr>
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
