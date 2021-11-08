<%--
    Document   : register
    Created on : Oct 4, 2021, 9:26:20 PM
    Author     : USER
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form action="MainController" method="POST" id="form">

            User ID<input type="text" name="userID" required="" value="${requestScope.userID}" /><br/>
            ${requestScope.USER_ERROR.userID}<br/>
            Password<input type="password" name="password" required="" /><br/>
            ${requestScope.USER_ERROR.password}<br/>
            Confirm Password<input type="password" name="confirm" required=""/><br/>
            ${requestScope.USER_ERROR.confirm}<br/>
            Name<input type="text" name="name" required=""/><br/>
            ${requestScope.USER_ERROR.name}<br/>
            Address<input type="text" name="address" required=""/><br/>
            ${requestScope.USER_ERROR.address}<br/>
            Phone<input type="text" name="phone" required=""/><br/>
            ${requestScope.USER_ERROR.phone}<br/>
            <div class="g-recaptcha" data-sitekey="6LdN8IQbAAAAAKhHGm4SoyZFTWK89ir66FLntr80"></div>
            <div id="error" class="text-red-500"></div>
            <input type="submit" name ="action" value="Register"/>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>
        </form>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
                    window.onload = function (){
                    let isValid = false;
                            const form = document.getElementById("form");
                            const error = document.getElementById("error");
                            form.addEventListener("submit", function (event){
                            event.preventDefault();
                                    const response = grecaptcha.getResponse();
                                    if (response){
                            form.submit();
                            } else {
                            error.innerHTML = "Please check";
                            }
                            });
                    }
        </script>
    </body>
</html>
