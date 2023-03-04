<%-- 
    Document   : index
    Created on : Nov 14, 2022, 9:23:45 AM
    Author     : Harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Immunization - Home</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
<!--        <link href="css/sticky-footer.css" rel="stylesheet">-->
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">
        <!--<link href="css/dropdowns.css" rel="stylesheet">-->

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
        <link href="css/carousel.css" rel="stylesheet">-->
<!--        <link href="css/navbar-top-fixed.css" rel="stylesheet">-->
        <!--    <link href="css/footers.css" rel="stylesheet">-->

    </head>
    <body class="d-flex flex-column h-100 bg-success">
        
        <main class="flex-shrink-0">
            <jsp:include page="navbar.jsp"/>
            <br />
            <br />
            <br />
            <br />
            <div class="col-md-10 mx-auto col-lg-5">
                    <form class="p-4 p-md-5 border rounded-3 bg-light" method="post" action="/UserController?user_action=createAccount">
                        
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="First Name"  name="firstName">
                            <label for="floatingInput">First Name</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Provide a valid First Name.
                            </div>
                        </div>
                        
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="Last Name"  name="lastName">
                            <label for="floatingInput">Last Name</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Provide a valid Last Name.
                            </div>
                        </div>
                        
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
                            <label for="floatingInput">Email address</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Please choose a username.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="Phone"  name="phone">
                            <label for="floatingInput">Phone</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Provide a valid Phone.
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
                        <input type="hidden" name="role" value="user"> 
                        <button class="w-100 btn btn-lg btn-success" type="submit">Sign up</button>
                        <hr class="my-4">
                        <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                    </form>
                </div>
        </main>
             <br />
         <jsp:include page="footer.jsp"/>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
