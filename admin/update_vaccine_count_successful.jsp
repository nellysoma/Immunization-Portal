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
        <title>Immunization - Vaccination Site Created Successful</title>
        
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
           String sessionId = (String)request.getAttribute("sessionId");
           
       %>
        <jsp:include page="pageParts/admin_header.jsp"/> 
    </head>
    <body> 
        
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="pageParts/admin_left_menu.jsp"/>
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Vaccine Count Updated Successful</h1>
                    </div> 
                    <div class="card border-success mb-3" style="width: 60rem; padding: 10px;">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Vaccine Count Updated Successfully <a href="/AdministratorController?admin_action=goToDashboard&sessionId=<%=sessionId%>"><< Back</a>
                        </div>
                    </div>
                    
                </main>
            </div>
        </div>
        
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
