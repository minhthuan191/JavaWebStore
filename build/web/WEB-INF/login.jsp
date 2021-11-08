<%--
    Document   : Login
    Created on : Sep 23, 2021, 10:39:46 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
        <meta name="generator" content="Hugo 0.84.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/" />

        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
            html,
            body {
                height: 100%;
            }

            body {
                display: flex;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }

            .form-signin {
                width: 100%;
                max-width: 330px;
                padding: 15px;
                margin: auto;
            }

            .form-signin .checkbox {
                font-weight: 400;
            }

            .form-signin .form-floating:focus-within {
                z-index: 2;
            }

            .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }

            .form-signin input[type="password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

        </style>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link type="text/css" href="/asset/signin.css" />

    </head>
    <body class="text-center">
        <main class="form-signin">

            <form action="MainController" method="POST">
                <img
                    class="mb-4"
                    src="https://www.pinclipart.com/picdir/big/206-2065855_your-local-fruit-shop-logo-pack-download-your.png"
                    alt=""
                    width="72"
                    height="57"
                    />
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="userID" placeholder="UserID" />
                    <label for="floatingInput">User ID</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" />
                    <label for="floatingPassword">Password</label>
                </div>

                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8084/VegetableStore/LoginGoogleHandler&response_type=code
                   &client_id=495690914730-saeq55pnbgak2fme5prqbuq9t7foh89j.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                <button class="w-100 btn btn-lg btn-primary" type="submit" name ="action" value="Login" style="margin-bottom: 10px">Sign in</button>

                <button class="w-100 btn btn-lg btn-secondary" type="submit" name ="action" value="ShowRegister">Sign up</button>

                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <%= error%>
            </form>

        </main>
    </body>

</html>
