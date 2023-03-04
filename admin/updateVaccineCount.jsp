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
           String siteID = (String)request.getAttribute("siteID");
           String health_facility_type = (String)request.getAttribute("health_facility_type");
           String state = (String)request.getAttribute("state");
           String lga = (String)request.getAttribute("lga");
           String name = (String)request.getAttribute("name");
           String capacity = (String)request.getAttribute("capacity");
           String vaccine_available = (String)request.getAttribute("vaccine_available");
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
                    <div class="card border-success mb-3" style="width: 60rem; padding: 10px;">
                        
                        
                        <table class="table  table-bordered table-condensed table-hover table-striped table-sm">
                           <tbody>
                               <tr>
                                   <td>Site ID</td>
                                   <td><b><%=siteID%></b></td>
                                   <td>Health_Facility_Type</td>
                                   <td><b><%=health_facility_type%></b></td>
                               </tr>
                               
                               <tr>
                                   <td>State</td>
                                   <td><b><%=state%></b></td>
                                   <td>L.G.A</td>
                                   <td><b><%=lga%></b></td>
                               </tr>
                               
                               <tr>
                                   <td>Name</td>
                                   <td><b><%=name%></b></td>
                                   <td>Capacity</td>
                                   <td><b><%=capacity%></b></td>
                               </tr>
                               <tr>
                                   <td>Vaccine Available</td>
                                   <td><b><%=vaccine_available%></b></td>
                               </tr>
                           </tbody> 
                       </table>
                        
                        <form  class="row needs-validation" method="post" action="/AdministratorController?admin_action=updateVaccineCount"" novalidate>
                            
                            <div class="col-sm-3">
                                <label for="vaccine_count">No. of Vaccine</label>
                                <input type="text" class="form-control" id="vaccine_count"  name="vaccine_count"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                                <div class="invalid-feedback">
                                    Valid Vaccine Count is required.
                                </div>
                            </div>
                            
                            <br/>
                            <br/>
                            <br/>
                            
                            <div class="row">
                                <div class="col-sm-3">
                                    <input type="hidden" name="siteID" value="<%=siteID%>"/>
                                    <input type="hidden" name="sessionId" value="<%=sessionId%>"/>
                                    <button type="submit" class="btn btn-success">Update Vaccine Count</button>
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
