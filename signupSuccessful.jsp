<%-- 
    Document   : signupSuccessful
    Created on : Mar 29, 2022, 10:16:37 PM
    Author     : Harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BBYF - Sign Up Successful</title>
        
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
        <div class="container-fluid">
            <div class="row">
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Sign Up Successful</h1>
                    </div> 
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Account created successfully <a href="login.jsp">Click here to login</a>
                    </div>
                </main>
            </div>
        </div>
         <jsp:include page="footer.jsp"/>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
