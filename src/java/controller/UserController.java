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
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.VaccinationSite;
import org.apache.tomcat.util.http.fileupload.FileUploadException;

/**
 *
 * @author Harmony
 */
public class UserController extends HttpServlet {
    
    private java.util.Map<String, String[]> sessionMap = new HashMap<String, String[]>();// create HashMap

    public void createAccount (HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, IOException, ServletException, SQLException, SQLException{
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        
        DbConnection dbConnection = new DbConnection();
        
        //dbConnection.signUp(email, password,phone,role);
        dbConnection.createUserAccount(email, phone, email,password, role, firstName, lastName);
        
        if(role.equals("user")){
            
            dbConnection.createPatientInformation(firstName, "",lastName,email,phone, "", "",
            "", "", "", "", "", "");
            
            dbConnection.createHealthInformation(email, "", "", "", "", "","");
            
            dbConnection.createSchedulingInformation(email, "", "","", "", "", "","", "", "", "");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/signupSuccessful.jsp");

        rd.forward(request, response);
    }
    
    public void userLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/user/userDashboard.jsp");

        rd.forward(request, response);
    }
    
    public void goToUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/user/updateProfile.jsp");

        rd.forward(request, response);
    }
    
    public void editProfile(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException, ServletException, ClassNotFoundException{
         
         DbConnection dbobject = new DbConnection();
         
         String first_name = request.getParameter("first_name");
         String middle_name = request.getParameter("middle_name");
         String last_name = request.getParameter("last_name");
         String email = request.getParameter("email");
         String phone = request.getParameter("phone");
         String dob_known = request.getParameter("dob_known");
         String dob = request.getParameter("dob");
         String age = request.getParameter("age");
         String date = request.getParameter("date");
         String sex = request.getParameter("sex");
         String city = request.getParameter("city");
         String zip = request.getParameter("zip");
         String address = request.getParameter("address");
         String patientID = request.getParameter("patientID");
         
        String sessionId = request.getParameter("sessionId");
         
        DbConnection dbconnection = new DbConnection();
            
        dbconnection.updatePatientInformation(patientID,first_name, middle_name, last_name, email, phone, dob_known, dob,
                age,date,sex,address, city, zip);
            
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
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/user/edit_profile_successful.jsp");
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/user/userDashboard.jsp");

        rd.forward(request, response);
    }
    
    public void goToBookVaccination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/user/bookVaccination.jsp");

        rd.forward(request, response);
    }
    
    public void searchVaccineSite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException{
        
        String sessionId = request.getParameter("sessionId");
        String health_facility_type = request.getParameter("health_facility_type");
        String state_for_vaccination = request.getParameter("state_for_vaccination");
        String lga = request.getParameter("lga");
        String preferred_date = request.getParameter("preferred_date");
        
        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        DbConnection dbobject = new DbConnection();
        
        List<VaccinationSite> availableVaccinationSiteList  = dbobject.searchAvailableVaccinationSite(health_facility_type, state_for_vaccination, lga);
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName); 
        request.setAttribute("sessionLastrName", sessionLastrName); 
        request.setAttribute("sessionUserImage", sessionUserImage);
        request.setAttribute("availableVaccinationSiteList", availableVaccinationSiteList);
        request.setAttribute("preferred_date", preferred_date);
       
        
        RequestDispatcher rd = request.getRequestDispatcher("/user/searchVaccineSiteResult.jsp");

        rd.forward(request, response);
    }
    
    public void checkAvailability(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, ServletException, IOException{
        
        String sessionId = request.getParameter("sessionId");
        String siteID = request.getParameter("siteID");
        String capacity = request.getParameter("capacity");
        String preferred_date = request.getParameter("preferred_date");
        String health_facility_type = request.getParameter("health_facility_type");
        String state = request.getParameter("state");
        String lga = request.getParameter("lga");
        String name = request.getParameter("name");
        String sessionUserName1 = request.getParameter("sessionUserName");
        String dose = request.getParameter("dose");
        String address = request.getParameter("address");
        
        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionUserName = sessionMapValues[0];
        String sessionFirstName = sessionMapValues[1];
        String sessionLastrName = sessionMapValues[2];
        String sessionUserImage = sessionMapValues[3];
        
        LocalDate ld = LocalDate.parse(preferred_date, DateTimeFormatter.ISO_DATE);
        
        DayOfWeek dow = ld.getDayOfWeek();
        
        String stringRepForDay = dow.getDisplayName(TextStyle.FULL, Locale.getDefault());
        System.out.println(stringRepForDay);
       
        if(stringRepForDay.equals("Saturday") || stringRepForDay.equals("Sunday")){
            
            //tell the user that vaccination cannot be done on weekends
            request.setAttribute("sessionId", sessionId);
            
            RequestDispatcher rd = request.getRequestDispatcher("/user/weekendFailed.jsp");

            rd.forward(request, response);
        }else{
            
            DbConnection dbobject = new DbConnection();
        
        int seatCountForPreferredDate = dbobject.getTotalAppointmentForDate(siteID,preferred_date);
        int integerValueOfCapacity = Integer.parseInt(capacity);
        
        
        
        if(seatCountForPreferredDate < integerValueOfCapacity){
            
           //Book the user 
           dbobject.createAppointment(siteID, sessionUserName1, dose, preferred_date, "", health_facility_type, 
           state,lga,name,address);
           
            request.setAttribute("sessionId", sessionId);
            request.setAttribute("sessionUserName", sessionUserName);
            request.setAttribute("sessionFirstName", sessionFirstName);
            request.setAttribute("sessionLastrName", sessionLastrName);
            request.setAttribute("sessionUserImage", sessionUserImage);
            
            request.setAttribute("preferred_date", preferred_date);
            request.setAttribute("health_facility_type", health_facility_type);
            request.setAttribute("state", state);
            request.setAttribute("lga", lga);
            request.setAttribute("name", name);
            request.setAttribute("dose", dose);
            request.setAttribute("address", address);
            
            RequestDispatcher rd = request.getRequestDispatcher("/user/vaccinationAppointmentSuccessful.jsp");

            rd.forward(request, response);
           
        }else{
            
            //tell the user that the site is full for that day
            request.setAttribute("sessionId", sessionId);
            
            request.setAttribute("name", name);
            request.setAttribute("preferred_date", preferred_date);
            
            RequestDispatcher rd = request.getRequestDispatcher("/user/vaccinationAppointmentFailed.jsp");

            rd.forward(request, response);
        }
            
        }
           
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
         
        try {

            String user_action = request.getParameter("user_action");
            
            switch (user_action) {
                
               case "createAccount":
                    createAccount(request, response);
                    break;  
               case "userLogin":
                    userLogin(request, response);
                    break; 
                case "editProfile":
                    editProfile(request, response);
                    break;
                case "goToUpdateProfile":
                    goToUpdateProfile(request, response);
                    break;
                case "goToDashboard":
                    goToDashboard(request, response);
                    break;
                 case "goToBookVaccination":
                    goToBookVaccination(request, response);
                    break;
                  case "searchVaccineSite":
                    searchVaccineSite(request, response);
                    break;
                  case "checkAvailability":
                    checkAvailability(request, response);
                    break;
                case "logout":
                    logout(request, response);
                    break;
            }
            
        } catch (Exception error) {

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
