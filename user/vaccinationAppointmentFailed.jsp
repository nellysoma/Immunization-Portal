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
        <title>Immunization - Vaccination Appointment Failed</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

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
        <link href="css/dashboard.css" rel="stylesheet">   
        <%
            String sessionId = (String) request.getAttribute("sessionId");

            String preferred_date = (String) request.getAttribute("preferred_date");
            String health_facility_type = (String) request.getAttribute("health_facility_type");
            String state = (String) request.getAttribute("state");
            String lga = (String) request.getAttribute("lga");
            String name = (String) request.getAttribute("name");
            String dose = (String) request.getAttribute("dose");
            String address = (String) request.getAttribute("address");

        %>
        <jsp:include page="pageParts/user_header.jsp"/> 
    </head>
    <body> 

        <div class="container-fluid">
            <div class="row">
                <jsp:include page="pageParts/user_left_menu.jsp"/>
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Vaccination Appointment Failed</h1>
                    </div> 
                    <div class="card border-danger mb-3" style="width: 60rem; padding: 10px;">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            We could not find a spot for you at <%=name%> on <%=preferred_date%> all spots in 
                            <%=name%> on <%=preferred_date%>  are fully booked

                            <a href="/UserController?user_action=goToDashboard&sessionId=<%=sessionId%>"><< Back</a>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
