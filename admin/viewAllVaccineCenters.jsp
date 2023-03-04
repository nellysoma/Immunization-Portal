<%-- 
    Document   : viewAllUsers
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
        <title>Immunization - Dashboard</title>
        
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
            DbConnection dbobject = new DbConnection();

            getServletContext().setAttribute("vaccinationSiteList", dbobject.viewAllVaccinationSite());
            List<VaccinationSite> vaccinationSiteList = (List<VaccinationSite>) application.getAttribute("vaccinationSiteList");
            Iterator<VaccinationSite> iterator = vaccinationSiteList.iterator();
        %>
        <jsp:include page="pageParts/admin_header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="pageParts/admin_left_menu.jsp"/>
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">View All Vaccination Site</h1>
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
                                    <th>Capacity</th> 
                                    <th>No. of Vaccine Available</th>
                                    <th>Add Vaccine</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    while (iterator.hasNext()) {
                                        VaccinationSite vs = (VaccinationSite) iterator.next();
                                %>
                                <tr>
                                    
                                    <td></td>
                                    <td><%=vs.getSiteID()%></td>
                                    <td><%=vs.getHealthFacilityType()%></td>
                                    <td><%=vs.getState()%></td>
                                    <td><%=vs.getLga()%></td>
                                    <td><%=vs.getName()%></td>
                                    <td><%=vs.getAddress()%></td>
                                    <td><%=vs.getCapacity()%></td>
                                    <td><%=vs.getVaccineAvailable()%></td>
                                    <td> 
                                        <form method="post" action="/AdministratorController?admin_action=goToUpdateVaccineCount&sessionId=<%=sessionId%>">
                                            <input type="hidden" value="<%=vs.getSiteID()%>" name="siteID">
                                            <input type="hidden" value="<%=vs.getHealthFacilityType()%>" name="health_facility_type">
                                            <input type="hidden" value="<%=vs.getState()%>" name="state">
                                            <input type="hidden" value="<%=vs.getLga()%>" name="lga">
                                            <input type="hidden" value="<%=vs.getName()%>" name="name">
                                            <input type="hidden" value="<%=vs.getCapacity()%>" name="capacity">
                                            <input type="hidden" value="<%=vs.getVaccineAvailable()%>" name="vaccine_available">
                                            <center><button class="btn btn-sm btn-outline-success" type="submit"><span class="glyphicon glyphicon-eye-edit"></span> Add Vaccine </button></center>
                                        </form> 
                                    </td>
                                </tr>
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
