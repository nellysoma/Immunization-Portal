<%-- 
    Document   : admin_left_menu
    Created on : Nov 16, 2022, 10:36:28 AM
    Author     : Harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String sessionId = (String) request.getAttribute("sessionId");
    String sessionUserName = (String) request.getAttribute("sessionUserName");
%>


<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-success sidebar collapse">
      <div class="position-sticky pt-3">
          
          <div class="card border-primary mb-3" style="max-width: 18rem;">
              <div class="row no-gutters">
                  <div class="col-md-4">
                      <img src="/images/conversation-1.jpg" class="rounded card-img" alt="...">
                  </div>
                  <div class="col-md-8">
                      <div class="card-body">
                          <p class="card-text"><strong><small class="text-muted"><%=sessionUserName%></small></strong></p>
                      </div>
                  </div>
              </div>
          </div>  
          
        <div class="accordion border-warning" id="accordionExample">
            <div class="accordion-item">
                <div class="card bg-success">
                    <div class="card-header accordion-header" id="headingOne" >
                        
                            <a class="nav-link text-left text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <center>Manage Users</center>
                            </a>
                        
                    </div>

                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                        <div class="card-body accordion-body">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="/AdministratorController?admin_action=goToViewAllUsers&sessionId=<%=sessionId%>">View All Users</a></li>
                                
                                <li class="list-group-item"><a href="/AdministratorController?admin_action=goToCreateHealthWorker&sessionId=<%=sessionId%>">Create Health Worker</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card bg-success">
            <div class="card-header accordion-header" id="headingTwo">
                
                    <a class="nav-link text-white text-left" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        
                        <center>Manage Vaccination Site</center>
                    </a>
                
            </div>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body accordion-body">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="/AdministratorController?admin_action=goToCreateVaccinationSite&sessionId=<%=sessionId%>">Create Vaccination Site</a></li>
                        <li class="list-group-item"><a href="/AdministratorController?admin_action=goToUpdateVaccineAvailability&sessionId=<%=sessionId%>">Update Vaccine Availability</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
<!--        <div class="card bg-success">
            <div class="card-header accordion-header" id="headingThree">
                <a class="nav-link text-white text-left" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">

                    <center>Manage Jobs</center>
                </a>
            </div>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                <div class="card-body accordion-body">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="/AdministratorController?admin_action=goToCreateNewVaccancy&sessionId=<%=sessionId%>">Post Job</a></li>
                        <li class="list-group-item"><a href="/AdministratorController?admin_action=goToViewJobApplications&sessionId=<%=sessionId%>">View Job Applications</a></li>
                        <li class="list-group-item"><a href="/AdministratorController?admin_action=goToViewJobPostings&sessionId=<%=sessionId%>">View Job Posting</a></li>
                    </ul>
                </div>
            </div>
        </div>-->
       
        <!--<div class="card">
            <div class="card-header accordion-header" id="headingFour">
                <h2 class="mb-0">
                    <button class="btn btn-block btn-primary text-left collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                       <center><strong>Event Management</strong></center>
                    </button>
                </h2>
            </div>
            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                <div class="card-body accordion-body">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="/AdministratorController?administrator_action=goToAddEventType&sessionId=<%=sessionId%>">Add Event Type</a></li>
                    </ul>
                </div>
            </div>
        </div>-->
                    
    </div>                
          
       
      </div>
    </nav>
