<%-- 
    Document   : adminDashboard
    Created on : Nov 16, 2022, 10:59:06 AM
    Author     : Harmony
--%>

<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Immunization - Search Immunization Center</title>
        
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
       <link href="css/wbn-datepicker.css" rel="stylesheet">
       
       
    </head>
    <body>
        <%
            String sessionId = (String)request.getAttribute("sessionId");
            String sessionUserName = (String) request.getAttribute("sessionUserName");
            
            DbConnection dbobject = new DbConnection();
            
            getServletContext().setAttribute("patientInfo", dbobject.viewPatientInformation(sessionUserName));
            String[] patientInfo = (String[]) application.getAttribute("patientInfo");
            
            
             String patientID = patientInfo[0];
            if(patientID == null){
                patientID = "";
            }
            
            
            String first_name = patientInfo[1];
            if(first_name == null){
                first_name = "";
            }
           
           
            
            String middle_name = patientInfo[2];
            if(middle_name == null){
                middle_name = "";
            }
            
            String last_name = patientInfo[3];
            if(last_name == null){
                last_name = "";
            }
            
            String email = patientInfo[4];
            if(email == null){
                email = "";
            }
            
            String phone = patientInfo[5];
            if(phone == null){
                phone = "";
            }
            
            String address = patientInfo[6];
            if(address == null){
                address = "";
            }
            
            String dobKnown = patientInfo[7];
            if(dobKnown == null){
                dobKnown = "";
            }
            
            String dob = patientInfo[8];
            if(dob == null){
                dob = "";
            }
            
            String age = patientInfo[9];
            if(age == null){
                age = "";
            }
            
            String date = patientInfo[10];
            if(date == null){
                date = "";
            }
            
            String sex = patientInfo[11];
            if(sex == null){
                sex = "";
            }
            
            String city = patientInfo[12];
            if(city == null){
                city = "";
            }
            
            String zip = patientInfo[13];
            if(zip == null){
                zip = "";
            }
        %>
        <jsp:include page="pageParts/user_header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="pageParts/user_left_menu.jsp"/>
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Search Immunization Center</h1>
                    </div>
                    <div class="card border-success mb-3" style="width: 60rem; padding: 10px;">
                        <form class="row needs-validation" method="post" action="/UserController?user_action=searchVaccineSite" novalidate>   
                                    <div class="row">
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
                                            <label for="state_for_vaccination">State for Vaccination</label>
                                            <select class="form-select" name="state_for_vaccination" required>
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
                                                <option value="jigawa">jigawa</option>
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
                                                Please provide a valid State for Vaccination.
                                            </div>
                                        </div> 
                                        
                                        <div class="col-sm-3">
                                            <label for="lga"> L.G.A </label>
                                            <input type="text" class="form-control" id="lga" name="lga" required>

                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                            <div class="invalid-feedback">
                                                Valid L.G.A is required.
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-3">
                                              <label for="preferred_date"> Preferred Date </label>    
                                              <input type="text" id="preferred_date" class="form-control wbn-datepicker" name="preferred_date" placeholder="dob" required/>  
                                              <div class="valid-feedback">
                                                    Looks good!
                                              </div>
                                              <div class="invalid-feedback">
                                                    Valid Preferred Date is required.
                                              </div>
                                        </div>
                                        
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <input type="hidden" name="sessionId" value="<%=sessionId%>"/>
                                                    <button type="submit" class="btn btn-success">Search</button>
                                                </div>
                                            </div>
                                        
                                    </div>               
                        </form>
                    </div>
                </main>
            </div>
        </div>
            <script src="js/bootstrap.bundle.min.js"></script>
            <script src="js/dashboard.js"></script>
            <script src="js/sidebars.js"></script>
            <script src="js/jquery-3.3.1.min.js"></script> 
            <script src="js/wbn-datepicker.js"></script>
        <script>
            $('.wbn-datepicker').datepicker();
        </script>
    </body>
</html>