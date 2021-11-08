<%-- 
    Document   : createProduct
    Created on : Oct 8, 2021, 4:35:56 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Product Page</title>
    </head>
    <body>
        <h1>Add new product</h1>
        <form action="MainController" method="POST">
            Product ID<input type="text" name="productID" /><br/>
            ${requestScope.PRODUCT_ERROR.productID}<br/>
            Name<input type="text" name="name"/><br/>
            ${requestScope.PRODUCT_ERROR.name}<br/>
            Category ID<input type="text" name="categoryID"/><br/>
            ${requestScope.PRODUCT_ERROR.categoryID}<br/>
            Description<input type="text" name="descr" /><br/>
            ${requestScope.PRODUCT_ERROR.descr}<br/>
            Image<input type="text" name="img"/><br/>
            ${requestScope.PRODUCT_ERROR.img}<br/>
            Quantity<input type="text" name="quantity" /><br/>
            ${requestScope.PRODUCT_ERROR.quantity}<br/>
            Price<input type="text" name="price" /><br/>
            ${requestScope.PRODUCT_ERROR.price}<br/>
            Status ID<select name="statusID">
                <option value="0" selected="">Available</option>
                <option value="1" selected="">Disable</option>
            </select><br/>
            <br/>
            Expiration date<input type="text" name="expiration" /><br/>
            ${requestScope.PRODUCT_ERROR.expiration}<br/>
            <input type="submit" name ="action" value="CreateProduct"/>
            <%
                String error = (String)request.getAttribute("ERROR");
                if(error == null){
                    error="";
                }
            %>
            <%= error %>
        </form>
    </body>
</html>
