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
        <title>Immunization - Update Profile</title>
        
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
                        <h1 class="h2">Update Profile</h1>
                    </div>
                    <div class="card border-success mb-3" style="width: 60rem; padding: 10px;">
                        <nav>
                            <div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="true">Profile</button>
                                <button class="nav-link" id="nav-health-tab" data-bs-toggle="tab" data-bs-target="#nav-health" type="button" role="tab" aria-controls="nav-health" aria-selected="true">Health Information</button>
                            </div>
                        </nav>
                        <form class="row needs-validation" method="post" action="/UserController?user_action=editProfile" novalidate>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <div class="row">
                                        
                                        <div class="col-sm-3">
                                            <label for="first_name"> First Name </label>
                                            <input type="text" class="form-control" id="first_name" name="first_name" value="<%=first_name%>" readonly required>

                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                            <div class="invalid-feedback">
                                                Valid First Name is required.
                                            </div>
                                        </div>
                                         
                                        <div class="col-sm-3">
                                            <label for="middle_name"> Middle Name </label>
                                            <input type="text" class="form-control" id="middle_name" name="middle_name" value="<%=middle_name%>" required>

                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                            <div class="invalid-feedback">
                                                Valid Middle Name is required.
                                            </div>
                                        </div>
                                            
                                        <div class="col-sm-3">
                                            <label for="last_name"> Last Name </label>
                                            <input type="text" class="form-control" id="middle_name" name="last_name" value="<%=last_name%>" readonly required>

                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                            <div class="invalid-feedback">
                                                Valid Last Name is required.
                                            </div>
                                        </div>
                                            
                                        <div class="col-sm-3">
                                            <label for="email"> E-Mail </label>
                                            <input type="text" class="form-control" id="email" name="email" value="<%=email%>" readonly required>

                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                            <div class="invalid-feedback">
                                                Valid E-Mail is required.
                                            </div>
                                        </div>
                                      
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label for="phone"> Phone </label>
                                            <input type="text" class="form-control" id="phone" name="phone" value="<%=phone%>"  required>

                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                            <div class="invalid-feedback">
                                                Valid Phone is required.
                                            </div>
                                        </div>   
                                            
                                        <div class="col-sm-3">
                                                <label for="dob_known">Is Date of Birth Known?</label>
                                                <select class="form-select" name="dob_known" required>
                                                    <option value="<%=dobKnown%>"><%=dobKnown%></option>
                                                    <option value="Yes">Yes</option>
                                                    <option value="No">No</option>
                                                </select>
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please provide an Answer.
                                                </div>
                                        </div> 
                                                    
                                        <div class="col-sm-3">
                                              <label for="dob"> Date of Birth </label>    
                                              <input type="text" id="dob" class="form-control wbn-datepicker" name="dob" data-min="1920-01-01" data-max="2002-12-31" placeholder="dob" required>  
                                              <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Valid Date of Birth is required.
                                                </div>
                                        </div>
                                            
                                       <div class="col-sm-3">
                                                <label for="age"> Age </label>
                                                <input type="text" class="form-control" id="age" name="age" value="<%=age%>"  required>

                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Valid Phone is required.
                                                </div>
                                            </div>  
                                            
                                    </div> 
                                                
                                    <div class="row">
                                        <div class="col-sm-3">
                                                <label for="sex">Sex</label>
                                                <select class="form-select" name="sex" required>
                                                    <option value="<%=sex%>"><%=sex%></option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please provide an Answer.
                                                </div>
                                            </div>  
                                             
                                            <div class="col-sm-3">
                                                <label for="city"> City </label>
                                                <input type="text" class="form-control" id="city" name="city" value="<%=city%>"  required>

                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Valid City is required.
                                                </div>
                                            </div> 
                                             
                                            <div class="col-sm-3">
                                                <label for="zip"> Zip </label>
                                                <input type="text" class="form-control" id="zip" name="zip" value="<%=zip%>"  required>

                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Valid Zip is required.
                                                </div>
                                            </div> 
                                                
                                            <div class="col-sm-3">
                                                <label for="date"> Date </label>
                                                <input type="text" class="form-control" id="date" name="date" value="<%=date%>"  required>

                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Valid Date is required.
                                                </div>
                                            </div> 
                                                
                                        </div>
                                                
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label for="address"> Address </label>
                                            <input type="text" class="form-control" id="address" name="address" value="<%=address%>"  required>
                                            <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Valid Address is required.
                                                </div>
                                        </div>
                                        
                                               
                                    </div>
                                            
                                    <br/>
                                        
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <input type="hidden" name="patientID" value="<%=patientID%>"/>
                                                    <input type="hidden" name="sessionId" value="<%=sessionId%>"/>
                                                    <button type="submit" class="btn btn-success">Update Profile</button>
                                                </div>
                                            </div>
                                </div>
                               
                                                    
                                <div class="tab-pane fade show" id="nav-health" role="tabpanel" aria-labelledby="nav-health-tab">
                                       
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label for="field">Health Facility Type</label>
                                            <select class="form-select" name="health_facility_type" required>
                                                <option selected disabled value="">Choose...</option>
                                                <option value="WAEC">Public Health Center</option>
                                                <option value="Bsc">Private Hospital</option>
                                                <option value="Msc">Teaching Hospital</option>
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
                                              <label for="dob"> Date of Birth </label>    
                                              <input type="text" id="dob" class="form-control wbn-datepicker" name="dob" data-min="1920-01-01" data-max="2002-12-31" placeholder="dob" required>  
                                              <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Valid Date of Birth is required.
                                                </div>
                                        </div>
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