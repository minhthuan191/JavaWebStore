<%-- 
    Document   : createCategory
    Created on : Oct 9, 2021, 3:40:18 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Category</title>
    </head>
    <body>
        <h1>Add new category</h1>
        <form action="MainController">
            Category ID <input type="text" name="categoryID" /><br>
            ${requestScope.CATEGORY_ERROR.categoryID}<br>
            Category Name <input type="text" name="categoryName"/><br>
            ${requestScope.CATEGORY_ERROR.categoryName}<br>
            <input type="submit" name="action" value="CreateCategory"/>
        </form>
    </body>
</html>
