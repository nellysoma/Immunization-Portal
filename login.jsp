<%-- 
    Document   : signup
    Created on : Mar 4, 2022, 10:39:25 AM
    Author     : Harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Immunization - Login</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">

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
        </style>

        <!-- Custom styles for this template -->
<!--        <link href="css/headers.css" rel="stylesheet">
        <link href="css/navbar-top-fixed.css" rel="stylesheet">
        <link href="css/footers.css" rel="stylesheet">-->

    </head>
    <body class="d-flex flex-column h-100 bg-success">
        <jsp:include page="navbar.jsp"/>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5">
            <div class="row align-items-center g-lg-5 py-5">
                <div class="col-lg-7 text-center text-lg-start">
                    <h1 class="display-4 fw-bold lh-1 mb-3 text-white">COVID-19 Immunization Portal  Login</h1>
                </div>
                <div class="col-md-10 mx-auto col-lg-5">
                    <form class="p-4 p-md-5 border rounded-3 bg-light" method="post" action="/LoginRouterController?login_action=loginRouter">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="username">
                            <label for="floatingInput">Email address</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Please choose a username.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>
                        <button class="w-100 btn btn-lg btn-success" type="submit">Login</button>
                        <hr class="my-4">
                        <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
