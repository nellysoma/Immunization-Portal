/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DbConnection;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Harmony
 */
public class AdministratorController extends HttpServlet {
    
     private java.util.Map<String, String[]> sessionMap = new HashMap<String, String[]>();// create HashMap
     
     public void administratorLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String[] sessionData = (String[])request.getAttribute("sessionData");
        
        HttpSession session = request.getSession(true);
        
        String sessionId = session.getId();

        sessionMap.put(sessionId, sessionData);
        
        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = request.getRequestDispatcher("/admin/adminDashboard.jsp");

        rd.forward(request, response);
    }
    
     public void goToViewAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String sessionId = request.getParameter("sessionId");
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/viewAllUsers.jsp");
        rd.forward(request, response);
    }
     
     public void goToCreateVaccinationSite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String sessionId = request.getParameter("sessionId");
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/createVaccinationSite.jsp");
        rd.forward(request, response);
    }
     
     public void goToCreateHealthWorker(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String sessionId = request.getParameter("sessionId");
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/createHealthWorker.jsp");
        rd.forward(request, response);
    }
     
     public void goToDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String sessionId = request.getParameter("sessionId");
        
        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = request.getRequestDispatcher("/admin/adminDashboard.jsp");

        rd.forward(request, response);
    }
     
     public void deleteUserByAdmin(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IOException, ServletException{
        
        String user_id = request.getParameter("userID");
        
        DbConnection dbobject = new DbConnection();
        
        dbobject.deleteUserByAdmin(user_id);
        
        goToViewAllUsers(request,  response);
    }
     
     public void createAccount (HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, IOException, ServletException, SQLException{
        
        String email = request.getParameter("email");
        String password = "password";
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String sessionId = request.getParameter("sessionId");
        
        DbConnection dbConnection = new DbConnection();
        
        dbConnection.createUserAccount(email, phone, email,password, role, firstName, lastName);
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = request.getRequestDispatcher("/admin/createHealthWorkerSuccessful.jsp");

        rd.forward(request, response);
    }
     
     public void createVaccinationSite (HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, IOException, ServletException, SQLException{
        
        String health_facility_type = request.getParameter("health_facility_type");
        String state = request.getParameter("state");
        String lga = request.getParameter("lga");
        String name_of_health_facility = request.getParameter("name_of_health_facility");
        String address = request.getParameter("address");
        String capacity = request.getParameter("capacity");
        String sessionId = request.getParameter("sessionId");
        
        DbConnection dbConnection = new DbConnection();
        
        dbConnection.createVaccinationSite(health_facility_type, state, lga,name_of_health_facility, address,capacity);
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = request.getRequestDispatcher("/admin/createVaccinationSiteSuccessful.jsp");

        rd.forward(request, response);
    }
     
     public void goToUpdateVaccineAvailability(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String sessionId = request.getParameter("sessionId");
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
       
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/viewAllVaccineCenters.jsp");
        rd.forward(request, response);
    }
     
     public void goToUpdateVaccineCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String sessionId = request.getParameter("sessionId");
        String siteID = request.getParameter("siteID");
        String health_facility_type = request.getParameter("health_facility_type");
        String state = request.getParameter("state");
        String lga = request.getParameter("lga");
        String name = request.getParameter("name");
        String capacity = request.getParameter("capacity");
        String vaccine_available = request.getParameter("vaccine_available");
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
       
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        
        request.setAttribute("siteID", siteID);
        request.setAttribute("health_facility_type", health_facility_type);
        request.setAttribute("state", state);
        request.setAttribute("lga", lga);
        request.setAttribute("name", name);
        request.setAttribute("capacity", capacity);
        request.setAttribute("vaccine_available", vaccine_available);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/updateVaccineCount.jsp");
        rd.forward(request, response);
    }
     
     public void updateVaccineCount(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, ServletException, IOException{
        
        String vaccine_count = request.getParameter("vaccine_count");
        String sessionId = request.getParameter("sessionId");
        String siteID = request.getParameter("siteID");
        
        DbConnection dbobject = new DbConnection();
        
        String vaccineBalance = dbobject.getVaccineBalance(siteID);
        
        double doubleValueOfVaccineBalance =  Double.parseDouble(vaccineBalance);
        
        double doubleValueOfvaccineCount= Double.parseDouble(vaccine_count);
        
        double newBalance = doubleValueOfVaccineBalance + doubleValueOfvaccineCount;
        
        String stringValueOfNewBalance = String.valueOf(newBalance);
        
        dbobject.updateVaccineCount(siteID,stringValueOfNewBalance);
        
      String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/update_vaccine_count_successful.jsp");

        rd.forward(request, response);
        
    }
     
     public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");
                
        sessionMap.remove(sessionId);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
        rd.forward(request, response);
    }
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            
            String admin_action = request.getParameter("admin_action");
            
            switch (admin_action) {
                
               case "createAccount":
                    createAccount(request, response);
                    break; 
                case "createVaccinationSite":
                    createVaccinationSite(request, response);
                    break; 
                case "administratorLogin":
                    administratorLogin(request, response);
                    break; 
                case "goToViewAllUsers":
                    goToViewAllUsers(request, response);
                    break; 
                case "goToCreateVaccinationSite":
                    goToCreateVaccinationSite(request, response);
                    break;
                case "goToCreateHealthWorker":
                    goToCreateHealthWorker(request, response);
                    break;
                case "goToDashboard":
                    goToDashboard(request, response);
                    break;
                case "deleteUserByAdmin":
                    deleteUserByAdmin(request, response);
                    break;
                case "goToUpdateVaccineAvailability":
                    goToUpdateVaccineAvailability(request, response);
                    break;
                case "goToUpdateVaccineCount":
                    goToUpdateVaccineCount(request, response);
                    break;
                case "updateVaccineCount":
                    updateVaccineCount(request, response);
                    break;
               case "logout":
                    logout(request, response);
                    break;
            }
            
        }catch (Exception error) {

            error.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
