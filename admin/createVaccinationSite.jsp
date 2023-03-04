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
        <title>Immunization - Create Vaccination Site</title>
        
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
                        <h1 class="h2">Create Vaccination Site</h1>
                    </div>
                    <div class="card border-primary mb-3" style="width: 60rem; padding: 10px;">
                        <form  class="row needs-validation" method="post" action="/AdministratorController?admin_action=createVaccinationSite"" novalidate>
                            
                            <div class="col-sm-3">
                                <label for="field">Health Facility Type</label>
                                <select class="form-select" name="health_facility_type" required>
                                    <option selected disabled value="">Choose...</option>
                                    <option value="Public Health Center">Public Health Center</option>
                                    <option value="Private Hospital">Private Hospital</option>
                                    <option value="Teaching Hospital">Teaching Hospital</option>
                                </select>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Please provide a valid Health Facility Type.
                                </div>
                            </div> 
                            
                            <div class="col-sm-3">
                                            <label for="state">State</label>
                                            <select class="form-select" name="state" required>
                                                <option selected disabled value="">Choose...</option>
                                                <option value="Abia">Abia</option>
                                                <option value="Adamawa">Adamawa</option>
                                                <option value="Akwa Ibom">Akwa Ibom</option>
                                                <option value="Anambara">Anambara</option>
                                                <option value="Bauchi">Bauchi</option>
                                                <option value="Bayelsa">Bayelsa</option>
                                                <option value="Benue">Benue</option>
                                                <option value="Borno">Borno</option>
                                                <option value="Cross River">Cross River</option>
                                                <option value="Delta">Delta</option>
                                                <option value="Ebonyi">Ebonyi</option>
                                                <option value="Edo">Edo</option>
                                                <option value="Ekiti">Ekiti</option>
                                                <option value="Enugu">Enugu</option>
                                                <option value="Gombe">Gombe</option>
                                                <option value="Imo">Imo</option>
                                                <option value="Jigawa">Jigawa</option>
                                                <option value="Kaduna">Kaduna</option>
                                                <option value="Kano">Kano</option>
                                                <option value="Kastina">Kastina</option>
                                                <option value="Kebbi">Kebbi</option>
                                                <option value="Kogi">Kogi</option>
                                                <option value="Kwara">Kwara</option>
                                                <option value="Lagos">Lagos</option>
                                                <option value="Nasarawa">Nasarawa</option>
                                                <option value="Niger">Niger</option>
                                                <option value="Ogun">Ogun</option>
                                                <option value="Ondo">Ondo</option>
                                                <option value="Osun">Osun</option>
                                                <option value="Oyo">Oyo</option>
                                                <option value="Plateau">Plateau</option>
                                                <option value="Rivers">Rivers</option>
                                                <option value="Sokoto">Sokoto</option>
                                                <option value="Taraba">Taraba</option>
                                                <option value="Yobe">Yobe</option>
                                                <option value="Zamfara">Zamfara</option>
                                                <option value="FCT">FCT</option>
                                            </select>
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                            <div class="invalid-feedback">
                                                Please provide a valid State.
                                            </div>
                                        </div> 
                            
                            <div class="col-sm-3">
                                <label for="lga">L.G.A</label>
                                <input type="text" class="form-control" id="lga"  name="lga"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid L.G.A is required.
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <label for="name">Name of Health Facility</label>
                                <input type="text" class="form-control" id="name"  name="name_of_health_facility"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid Name of Health Facility is required.
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address"  name="address"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid Address is required.
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <label for="capacity">Capacity</label>
                                <input type="text" class="form-control" id="capacity"  name="capacity"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid Capacity is required.
                                </div>
                            </div>
                            
                            
                            <br/>
                            <br/>
                            <br/>
                            
                            <div class="row">
                                <div class="col-sm-3">
                                    <input type="hidden" name="sessionId" value="<%=sessionId%>"/>
                                    <button type="submit" class="btn btn-success">Create Vaccination Site</button>
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
