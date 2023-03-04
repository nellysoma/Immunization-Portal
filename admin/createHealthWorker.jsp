<%-- 
    Document   : createNewVaccancy
    Created on : May 28, 2022, 5:53:39 PM
    Author     : Harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Immunization - Create Health Worker</title>
        
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
           String applicationID = (String)request.getAttribute("applicationID");
       %>
       <jsp:include page="pageParts/admin_header.jsp"/> 
        
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="pageParts/admin_left_menu.jsp"/>
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Create Health Worker</h1>
                    </div>
                    <div class="card border-success mb-3" style="width: 60rem; padding: 10px;">
                        <form  class="row needs-validation" method="post" action="/AdministratorController?admin_action=createAccount"" novalidate>
                            
                            <div class="col-sm-3">
                                <label for="first_name">First Name</label>
                                <input type="text" class="form-control" id="state"  name="firstName"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid First Name is required.
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <label for="last_name">Last Name</label>
                                <input type="text" class="form-control" id="last_name"  name="lastName"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid Last Name is required.
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <label for="phone">Phone</label>
                                <input type="text" class="form-control" id="phone"  name="phone"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid Phone is required.
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <label for="email">E-Mail</label>
                                <input type="text" class="form-control" id="email"  name="email"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid E-Mail is required.
                                </div>
                            </div>
                            
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            
                            <div class="row">
                                <div class="col-sm-3">
                                    <input type="hidden" name="sessionId" value="<%=sessionId%>"/>
                                    <input type="hidden" name="role" value="health_worker"/>
                                    <button type="submit" class="btn btn-success">Create Health Worker</button>
                                </div>
                            </div>
                            
                        </form>
                    </div>
                </main>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
