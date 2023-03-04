<%-- 
    Document   : admin_header
    Created on : Nov 16, 2022, 9:40:29 AM
    Author     : Harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String sessionId = (String) request.getAttribute("sessionId");
%>

<header class="navbar navbar-dark sticky-top bg-success flex-md-nowrap p-0 shadow">
<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Immunization</a>-->
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 <ul class="navbar-nav">
    <li class="nav-item text-nowrap">
      <a class="btn btn-danger" href="/AdministratorController?admin_action=logout&sessionId=<%=sessionId%>">Sign out</a>
    </li>
  </ul>
</header>
