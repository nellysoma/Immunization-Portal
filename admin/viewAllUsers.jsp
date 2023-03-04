<%-- 
    Document   : viewAllUsers
    Created on : Apr 9, 2022, 2:32:49 PM
    Author     : Harmony
--%>

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

            getServletContext().setAttribute("userList", dbobject.viewAllUsers());
            List<Users> userList = (List<Users>) application.getAttribute("userList");
            Iterator<Users> iterator = userList.iterator();
        %>
        <jsp:include page="pageParts/admin_header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="pageParts/admin_left_menu.jsp"/>
                <main role="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">View All Users</h1>
                    </div>
                    
                    <div class="card border-success mb-3" style="width: 60rem; padding: 10px;">
                        <table class="table  table-bordered table-condensed table-hover table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Phone </th>
                                    <th>Full Details </th>
                                    <th>Delete </th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    while (iterator.hasNext()) {
                                        Users u = (Users) iterator.next();
                                %>
                                <tr>
                                    
                                    <td></td>
                                    <td><%=u.getEmail()%></td>
                                    <td><%=u.getFirstName()%></td>
                                    <td><%=u.getLastName()%></td>
                                    <td><%=u.getPhone()%></td>
                                    <td>
                                        <form method="post" action="/AdministratorController?admin_action=viewUserDetails&sessionId=<%=sessionId%>">
                                            <input type="hidden" value="<%=u.getEmail()%>" name="userID">
                                            <center><button class="btn btn-sm btn-outline-success" type="submit"><span class="glyphicon glyphicon-eye-edit"></span> Full Details </button></center>
                                        </form> 
                                    </td>
                                    <td> 
                                        <form method="post" action="/AdministratorController?admin_action=deleteUserByAdmin&sessionId=<%=sessionId%>">
                                            <input type="hidden" value="<%=u.getEmail()%>" name="userID">
                                            <center><button class="btn btn-sm btn-outline-danger" type="submit"><span class="glyphicon glyphicon-eye-edit"></span> Delete </button></center>
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
