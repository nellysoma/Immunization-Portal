<%-- 
    Document   : navbar
    Created on : Nov 14, 2022, 9:21:27 AM
    Author     : Harmony
--%>

<header class="p-3 bg-white text-white fixed-top">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
                    </a>

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="index.jsp" class="nav-link px-2 text-secondary">Registration</a></li>
                        <li> 
                            <a class="nav-link text-dark dropdown-toggle" id="dropdownMenuButtonSM" data-bs-toggle="dropdown" aria-expanded="false">
                                Cooperate Vaccination
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButtonSM">
                                <li><a class="dropdown-item" href="#">Public Institutions</a></li>
                                <li><a class="dropdown-item" href="#">Private Institutions</a></li>
                            </ul>
                        </li>
                        <li><a href="about.jsp" class="nav-link px-2 text-dark">Vaccination Sites</a></li>
                        <li class="float-end"><a href="login.jsp" class="nav-link px-2 text-dark">Login</a></li>
                        <li class="float-end"><a href="signup.jsp" type="button" class="btn btn-success text-white">Vaccination Portal</a></li>
                       
<!--                        <li> 
                            <a class="nav-link text-white dropdown-toggle" id="dropdownMenuButtonSM" data-bs-toggle="dropdown" aria-expanded="false">
                                Competition
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButtonSM">
                                <li><a class="dropdown-item" href="#">Academics</a></li>
                                <li><a class="dropdown-item" href="#">Talents</a></li>
                            </ul>
                        </li>-->
                        
                    </ul>

<!--                  <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                        <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
                    </form>-->

<!--                    <div class="float-end">
                        <a href="login.jsp" type="button" class="btn btn-outline-light me-2" >Login</a>
                        <a href="signup.jsp" type="button" class="btn btn-warning float-end" >Create Account</a>
                    </div>-->
                </div>
            </div>
       </header>
