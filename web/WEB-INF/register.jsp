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
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Register</title>
        <style>
            f
        </style>
    </head>
    <body>
        <form action="MainController" method="POST" id="form" class="form-horizontal">
            <fieldset>
                <div id="legend">
                    <legend class="">Register</legend>
                </div>
                <div class="control-group">
                    <label class="control-label">User ID</label>
                    <div class="controls">
                        <input type="text" name="userID" required="" value="${requestScope.userID}" placeholder="User ID" class="input-xlarge">
                        ${requestScope.USER_ERROR.userID}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Password</label>
                    <div class="controls">
                        <input type="password" name="password" required="" placeholder="Password" class="input-xlarge">
                        ${requestScope.USER_ERROR.password}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Confirm Password</label>
                    <div class="controls">
                        <input type="password" name="confirm" required="" placeholder="Confirm Password" class="input-xlarge">
                        ${requestScope.USER_ERROR.confirm}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Name</label>
                    <div class="controls">
                        <input type="text" name="name" required="" placeholder="Full Name" class="input-xlarge">
                        ${requestScope.USER_ERROR.name}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Address</label>
                    <div class="controls">
                        <input type="text" name="address" required="" placeholder="Address" class="input-xlarge">
                        ${requestScope.USER_ERROR.address}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Phone</label>
                    <div class="controls">
                        <input type="text" name="Phone" required="" placeholder="Address" class="input-xlarge">
                        ${requestScope.USER_ERROR.phone}
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="g-recaptcha" data-sitekey="6LdN8IQbAAAAAKhHGm4SoyZFTWK89ir66FLntr80" style="margin-bottom: 10px"></div>
                        <div id="error" class="text-red-500"></div>
                        <button type="submit" name ="action" value="Register" class="btn btn-success">Register</button>
                    </div>
                </div>

                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <%= error%>
            </fieldset>
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
