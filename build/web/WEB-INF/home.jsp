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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
    </head>
    <body>
        <%
           ProductDAO dao = new ProductDAO();
           List<ProductDTO> listProduct = dao.getListProduct();
 
            for (int i = listProduct.size()-1; i >= 0 ;i--) {
                if (listProduct.get(i).statusID == "1") {
                    listProduct.remove(i);
                }
            }
            
            if (listProduct != null) {
                if (!listProduct.isEmpty()) {
        %>

        <table border = "1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Buy</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (ProductDTO product : listProduct) {
                %>
            <form action ="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><%= product.getName()%></td>
                    <td><%= product.getDescr()%></td>
                    <td><%= product.getImg()%></td>
                    <td><%= product.getPrice()%></td>
                    <td>
                        <button><a href="MainController?action=AddToCart&productID=<%=product.getProductID()%>&quantity=1">Add</a></button>
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
