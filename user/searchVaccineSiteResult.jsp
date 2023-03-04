<%-- 
    Document   : searchVaccineSiteResult
    Created on : Apr 9, 2022, 2:32:49 PM
    Author     : Harmony
--%>

<%@page import="model.VaccinationSite"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Immunization - Search Vaccine Site Result</title>
        
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
       
    </head>
    <body>
        <%
            String sessionId = (String)request.getAttribute("sessionId");
            String preferred_date = (String)request.getAttribute("preferred_date");
            String sessionUserName = (String)request.getAttribute("sessionUserName");
            
            List<VaccinationSite> availableVaccinationSiteList = (List<VaccinationSite>) request.getAttribute("availableVaccinationSiteList");
            
            Iterator<VaccinationSite> iterator = availableVaccinationSiteList.iterator();
        %>
        <jsp:include page="pageParts/user_header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="pageParts/user_left_menu.jsp"/>
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Search Result</h1>
                    </div>
                    
                    <div class="card border-success mb-3" style="width: 60rem; padding: 10px;">
                        <table class="table  table-bordered table-condensed table-hover table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>ID</th>
                                    <th>Health Facility Type</th>
                                    <th>State</th>
                                    <th>L.G.A</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Select Dosage</th>
                                    <th>Book Appointment</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    while (iterator.hasNext()) {
                                        VaccinationSite vs = (VaccinationSite) iterator.next();
                                %>
                                <form method="post" action="/UserController?user_action=checkAvailability&sessionId=<%=sessionId%>">
                                <tr>
                                    
                                    <td></td>
                                    <td><%=vs.getSiteID()%></td>
                                    <td><%=vs.getHealthFacilityType()%></td>
                                    <td><%=vs.getState()%></td>
                                    <td><%=vs.getLga()%></td>
                                    <td><%=vs.getName()%></td>
                                    <td><%=vs.getAddress()%></td>
                                    <td>
                                        <select class="form-select" name="dose" required>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </td>
                                    <td> 
                                        
                                            <input type="hidden" value="<%=vs.getSiteID()%>" name="siteID">
                                            <input type="hidden" value="<%=vs.getHealthFacilityType()%>" name="health_facility_type">
                                            <input type="hidden" value="<%=vs.getState()%>" name="state">
                                            <input type="hidden" value="<%=vs.getLga()%>" name="lga">
                                            <input type="hidden" value="<%=vs.getName()%>" name="name">
                                            <input type="hidden" value="<%=vs.getCapacity()%>" name="capacity">
                                            <input type="hidden" value="<%=vs.getVaccineAvailable()%>" name="vaccine_available">
                                            <input type="hidden" value="<%=preferred_date%>" name="preferred_date">
                                            <input type="hidden" value="<%=sessionUserName%>" name="sessionUserName">
                                            <input type="hidden" value="<%=vs.getAddress()%>" name="address">
                                            
                                            <center><button class="btn btn-sm btn-outline-success" type="submit"><span class="glyphicon glyphicon-eye-edit"></span> Book </button></center>
                                        
                                    </td>
                                </tr>
                                </form> 
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>
            <script src="js/bootstrap.bundle.min.js"></script>
            <script src="js/dashboard.js"></script>
            <script src="js/sidebars.js"></script>
    </body>
</html>
