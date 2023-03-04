/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.HealthInformation;
import model.Patient;
import model.SchedulingInformation;
import model.Users;
import model.VaccinationSite;

/**
 *
 * @author Harmony
 */
public class DbConnection {

    private static final String DATABASE_URL = "jdbc:mysql://localhost/immune?serverTimezone=UTC";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    private static Connection connection = null;

    private Statement viewAllUsers = null;
    private Statement viewAllVaccinationSite = null;
    private Statement viewPatientInformation = null;
    private Statement viewHealthInformation = null;
    private Statement viewSchedulingInformation = null;
    private Statement viewAppointmentInformation = null;
    private Statement selectUser = null;
    private Statement checkUsernameEntry = null;
    private Statement deleteUser = null;
    private Statement getVaccineBalance = null;
    private Statement searchAvailableVaccinationSite = null;
     private Statement getTotalAppointmentForDate = null;
   
    

    private PreparedStatement createUserAccount = null;
    private PreparedStatement createAppointment = null;
    private PreparedStatement createHealthInformation = null;
    private PreparedStatement createPatientInformation = null;
    private PreparedStatement createSchedulingInformation = null;
    private PreparedStatement createVaccinationSite = null;
    private PreparedStatement signUp = null;

    private PreparedStatement updateUserAccount = null;
    private PreparedStatement updateAppointment = null;
    private PreparedStatement updateHealthInformation = null;
    private PreparedStatement updatePatientInformation = null;
    private PreparedStatement updateVaccinationSite = null;
     private PreparedStatement updateVaccineCount = null;

    private ResultSet viewAllUsersResult = null;
    private ResultSet viewAllVaccinationSiteResult = null;
    private ResultSet viewPatientInformationResult = null;
    private ResultSet viewHealthInformationResult = null;
    private ResultSet viewSchedulingInformationResult = null;
    private ResultSet viewAppointmentInformationResult = null;
    private ResultSet selectUserResult = null;
    private ResultSet checkUsernameResultEntry = null;
    private ResultSet getVaccineBalanceResult = null;
    private ResultSet searchAvailableVaccinationSiteResult = null;
    private ResultSet getTotalAppointmentForDateResult = null;
    

    public static void connectToDataBase() throws ClassNotFoundException {

        try {

            // Load (and therefore register) the  Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get a Connection to the database
            connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);

        } catch (SQLException error) {

            System.out.print(error.getMessage());
            error.printStackTrace();
            System.out.print("What is trying to say here is that, it could not connect to the database");

        }
    }

    private void closeConnection(Connection connection) {
        if (connection == null) {
            return;
        }
        try {
            connection.close();
        } catch (SQLException ex) {
        }
    }

    public void createUserAccount(String user_name, String phone, String email,
            String password, String role, String first_name, String last_name) throws ClassNotFoundException, FileNotFoundException, SQLException {
        try {

            connectToDataBase();

            createUserAccount = connection.prepareStatement("INSERT INTO users(user_name,phone,"
                    + "email,password,role,first_name,last_name)VALUES(?,?,?,?,?,?,?)");

            createUserAccount.setString(1, user_name);
            createUserAccount.setString(2, phone);
            createUserAccount.setString(3, email);
            createUserAccount.setString(4, password);
            createUserAccount.setString(5, role);
            createUserAccount.setString(6, first_name);
            createUserAccount.setString(7, last_name);

            createUserAccount.executeUpdate();

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public String[] userLogin(String username, String password) throws ClassNotFoundException {

        String firstName = "";
        String lastName = "";
        String role = "";
        String username1 = "";
        String password1 = "";
        String profile_pic = "";
        

        try {

            connectToDataBase();

            String sql = "SELECT * FROM users WHERE email = '" + username + "'";

            selectUser = connection.createStatement();

            selectUserResult = selectUser.executeQuery(sql);

            while (selectUserResult.next()) {
                username1 = selectUserResult.getString("email");
                password1 = selectUserResult.getString("password");
                firstName = selectUserResult.getString("first_name");
                lastName = selectUserResult.getString("last_name");
                role = selectUserResult.getString("role");
                profile_pic = selectUserResult.getString("profile_pic");
                System.out.println("profile_pic is " +profile_pic);
            }

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
        return new String[]{password1, firstName, lastName, username1, role,profile_pic};
    }
    
    public int checkUsernameEntry(String email) throws ClassNotFoundException{
        
        int result = 0;
        try{
            connectToDataBase();
            
            String sql = "SELECT * FROM users WHERE email = '"+email+"'";
            
            checkUsernameEntry = connection.createStatement();
            
            checkUsernameResultEntry = checkUsernameEntry.executeQuery(sql);
            
            if(checkUsernameResultEntry.next()){
                
               result = 1; 
            }
            
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return result;
    }
    
    public void signUp(String email, String password, String phone , String role) throws ClassNotFoundException, FileNotFoundException {
        
        try {

            connectToDataBase();
            
            signUp = connection.prepareStatement("INSERT INTO users(user_name,password,email,phone,role)VALUES(?,?,?,?,?)");

            signUp.setString(1, email);
            signUp.setString(2, password);
            signUp.setString(3, email);
            signUp.setString(4, phone);
            signUp.setString(5, role);
            
            signUp.executeUpdate();

        } catch (SQLException error) {

            //error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }
    
    public void createAppointment(String site_id, String patient_id, String dose,
            String appointment_date, String appointment_time, String health_facility_type, 
            String state,String lga,String name,String address) throws ClassNotFoundException, FileNotFoundException, SQLException {
        try {

            connectToDataBase();

            createAppointment = connection.prepareStatement("INSERT INTO appointment(site_id,patient_id,"
                    + "dose,appointment_date,appointment_time,health_facility_type,state,lga,name,address)VALUES(?,?,?,?,?,?,?,?,?,?)");

            createAppointment.setString(1, site_id);
            createAppointment.setString(2, patient_id);
            createAppointment.setString(3, dose);
            createAppointment.setString(4, appointment_date);
            createAppointment.setString(5, appointment_time);
            createAppointment.setString(6, health_facility_type);
            createAppointment.setString(7, state);
            createAppointment.setString(8, lga);
            createAppointment.setString(9, name);
            createAppointment.setString(10, address);

            createAppointment.executeUpdate();

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void createHealthInformation(String patient_id, String known_medical_condition, String medical_condition,
            String reaction_to_vaccine, String feeling_sick, String immuno_compromised,
            String previous_dose) throws ClassNotFoundException, FileNotFoundException, SQLException {
        try {

            connectToDataBase();

            createHealthInformation = connection.prepareStatement("INSERT INTO health_information(patient_id,known_medical_condition,"
                    + "medical_condition,reaction_to_vaccine,feeling_sick,immuno_compromised,previous_dose)VALUES(?,?,?,?,?,?,?)");

            createHealthInformation.setString(1, patient_id);
            createHealthInformation.setString(2, known_medical_condition);
            createHealthInformation.setString(3, medical_condition);
            createHealthInformation.setString(4, reaction_to_vaccine);
            createHealthInformation.setString(5, feeling_sick);
            createHealthInformation.setString(6, immuno_compromised);
            createHealthInformation.setString(7, previous_dose);

            createHealthInformation.executeUpdate();

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void createPatientInformation(String first_name, String middle_name, String last_name,
            String email, String phone, String dob_known, String dob,
            String age, String date, String sex, String address, String city, String zip) throws ClassNotFoundException, FileNotFoundException, SQLException {
        try {

            connectToDataBase();

            createPatientInformation = connection.prepareStatement("INSERT INTO patient_information(first_name,middle_name,"
                    + "last_name,email,phone,dob_known,dob,age,date,sex,address,city,zip)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

            createPatientInformation.setString(1, first_name);
            createPatientInformation.setString(2, middle_name);
            createPatientInformation.setString(3, last_name);
            createPatientInformation.setString(4, email);
            createPatientInformation.setString(5, phone);
            createPatientInformation.setString(6, dob_known);
            createPatientInformation.setString(7, dob);
            createPatientInformation.setString(8, age);
            createPatientInformation.setString(9, date);
            createPatientInformation.setString(10, sex);
            createPatientInformation.setString(11, address);
            createPatientInformation.setString(12, city);
            createPatientInformation.setString(13, zip);

            createPatientInformation.executeUpdate();

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void createSchedulingInformation(String patient_id, String health_facility_type, String state_for_vaccination,
            String lga_for_vaccination, String preferred_date, String first_dose, String first_dose_date,
            String first_dose_site, String second_dose, String second_dose_date, String second_dose_site) throws ClassNotFoundException, FileNotFoundException, SQLException {
        try {

            connectToDataBase();

            createSchedulingInformation = connection.prepareStatement("INSERT INTO scheduling_information(patient_id,health_facility_type,"
                    + "state_for_vaccination,lga_for_vaccination,preferred_date,first_dose,first_dose_date,first_dose_site,second_dose,second_dose_date,second_dose_site)VALUES(?,?,?,?,?,?,?,?,?,?,?)");

            createSchedulingInformation.setString(1, patient_id);
            createSchedulingInformation.setString(2, health_facility_type);
            createSchedulingInformation.setString(3, state_for_vaccination);
            createSchedulingInformation.setString(4, lga_for_vaccination);
            createSchedulingInformation.setString(5, preferred_date);
            createSchedulingInformation.setString(6, first_dose);
            createSchedulingInformation.setString(7, first_dose_date);
            createSchedulingInformation.setString(8, first_dose_site);
            createSchedulingInformation.setString(9, second_dose);
            createSchedulingInformation.setString(10, second_dose_date);
            createSchedulingInformation.setString(11, second_dose_site);

            createSchedulingInformation.executeUpdate();

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void createVaccinationSite(String health_facility_type, String state, String lga,
            String name, String address, String capacity) throws ClassNotFoundException, FileNotFoundException, SQLException {
        try {

            connectToDataBase();

            createVaccinationSite = connection.prepareStatement("INSERT INTO vaccination_site(health_facility_type,state,"
                    + "lga,name,address,site_capacity)VALUES(?,?,?,?,?,?)");

            createVaccinationSite.setString(1, health_facility_type);
            createVaccinationSite.setString(2, state);
            createVaccinationSite.setString(3, lga);
            createVaccinationSite.setString(4, name);
            createVaccinationSite.setString(5, address);
            createVaccinationSite.setString(6, capacity);

            createVaccinationSite.executeUpdate();

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void updateUserAccount(String user_name, String phone, String email,
            String password, String role) throws ClassNotFoundException, FileNotFoundException {

        try {

            connectToDataBase();

            String sql = "UPDATE users SET user_name = ?, phone = ?, email = ?, password = ?, role = ?"
                    + "WHERE  email = '" + email + "' ";

            updateUserAccount = connection.prepareStatement(sql);

            updateUserAccount.setString(1, user_name);
            updateUserAccount.setString(2, phone);
            updateUserAccount.setString(3, email);
            updateUserAccount.setString(4, password);
            updateUserAccount.setString(5, role);

            updateUserAccount.executeUpdate();

        } catch (SQLException error) {

            //error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void updateAppointment(String appointment_id, String site_id, String patient_id, String dose,
            String appointment_date, String appointment_time) throws ClassNotFoundException, FileNotFoundException {

        try {

            connectToDataBase();

            String sql = "UPDATE appointment SET site_id = ?, patient_id = ?, appointment_date = ?, appointment_time = ?"
                    + "WHERE  appointment_id = '" + appointment_id + "' ";

            updateAppointment = connection.prepareStatement(sql);

            updateAppointment.setString(1, site_id);
            updateAppointment.setString(2, patient_id);
            updateAppointment.setString(3, dose);
            updateAppointment.setString(4, appointment_date);
            updateAppointment.setString(5, appointment_time);

            updateAppointment.executeUpdate();

        } catch (SQLException error) {

            //error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void updateHealthInformation(String health_info_id, String patient_id, String known_medical_condition, String medical_condition,
            String reaction_to_vaccine, String feeling_sick, String immuno_compromised,
            String previous_dose) throws ClassNotFoundException, FileNotFoundException {

        try {

            connectToDataBase();

            String sql = "UPDATE health_information SET patient_id = ?, known_medical_condition = ?, medical_condition = ?, reaction_to_vaccine = ?, feeling_sick = ?"
                    + ", immuno_compromised = ?, previous_dose = ?"
                    + "WHERE  health_info_id = '" + health_info_id + "' ";

            updateHealthInformation = connection.prepareStatement(sql);

            updateHealthInformation.setString(1, patient_id);
            updateHealthInformation.setString(2, known_medical_condition);
            updateHealthInformation.setString(3, medical_condition);
            updateHealthInformation.setString(4, reaction_to_vaccine);
            updateHealthInformation.setString(5, feeling_sick);
            updateHealthInformation.setString(6, immuno_compromised);
            updateHealthInformation.setString(7, previous_dose);

            updateHealthInformation.executeUpdate();

        } catch (SQLException error) {

            //error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void updatePatientInformation(String patient_id,String first_name, String middle_name, String last_name,
            String email, String phone, String dob_known, String dob,
            String age, String date, String sex, String address, String city, String zip) throws ClassNotFoundException, FileNotFoundException {

        try {

            connectToDataBase();

            String sql = "UPDATE patient_information SET first_name = ?, middle_name = ?, last_name = ?, email = ?, phone = ?"
                    + ", dob_known = ?, dob = ?, age = ?, date = ?, sex = ?, address = ?, city = ?, zip = ?"
                    + "WHERE  patient_id = '" + patient_id + "' ";

            updatePatientInformation = connection.prepareStatement(sql);

            updatePatientInformation.setString(1, first_name);
            updatePatientInformation.setString(2, middle_name);
            updatePatientInformation.setString(3, last_name);
            updatePatientInformation.setString(4, email);
            updatePatientInformation.setString(5, phone);
            updatePatientInformation.setString(6, dob_known);
            updatePatientInformation.setString(7, dob);
            updatePatientInformation.setString(8, age);
            updatePatientInformation.setString(9, date);
            updatePatientInformation.setString(10, sex);
            updatePatientInformation.setString(11, address);
            updatePatientInformation.setString(12, city);
            updatePatientInformation.setString(13, zip);

            updatePatientInformation.executeUpdate();

        } catch (SQLException error) {

            //error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void updateVaccinationSite(String site_id, String health_facility_type, String state, String lga,
            String name, String address) throws ClassNotFoundException, FileNotFoundException {

        try {

            connectToDataBase();

            String sql = "UPDATE vaccination_site SET health_facility_type = ?, state = ?, lga = ?, name = ?, address = ?"
                    + "WHERE  site_id = '" + site_id + "' ";

            updateVaccinationSite = connection.prepareStatement(sql);

            updateVaccinationSite.setString(1, health_facility_type);
            updateVaccinationSite.setString(2, state);
            updateVaccinationSite.setString(3, lga);
            updateVaccinationSite.setString(4, name);
            updateVaccinationSite.setString(5, address);

            updateVaccinationSite.executeUpdate();

        } catch (SQLException error) {

            //error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public List<Users> viewAllUsers() throws ClassNotFoundException {

        List<Users> result = new ArrayList();

        try {

            String sql = "SELECT * FROM users";
            connectToDataBase();

            viewAllUsers = connection.createStatement();

            viewAllUsersResult = viewAllUsers.executeQuery(sql);

            while (viewAllUsersResult.next()) {

                Users u = new Users();

                u.setUser_id(viewAllUsersResult.getString("user_id"));
                u.setUserName(viewAllUsersResult.getString("user_name"));
                u.setPassword(viewAllUsersResult.getString("password"));
                u.setEmail(viewAllUsersResult.getString("email"));
                u.setPhone(viewAllUsersResult.getString("phone"));
                u.setRole(viewAllUsersResult.getString("role"));
                u.setFirstName(viewAllUsersResult.getString("first_name"));
                u.setLastName(viewAllUsersResult.getString("last_name"));

                result.add(u);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return result;
    }
    
    public List<VaccinationSite> viewAllVaccinationSite() throws ClassNotFoundException {

        List<VaccinationSite> result = new ArrayList();

        try {

            String sql = "SELECT * FROM vaccination_site";
            connectToDataBase();

            viewAllVaccinationSite = connection.createStatement();

            viewAllVaccinationSiteResult = viewAllVaccinationSite.executeQuery(sql);

            while (viewAllVaccinationSiteResult.next()) {

                VaccinationSite vs = new VaccinationSite();

                vs.setSiteID(viewAllVaccinationSiteResult.getString("site_id"));
                vs.setHealthFacilityType(viewAllVaccinationSiteResult.getString("health_facility_type"));
                vs.setState(viewAllVaccinationSiteResult.getString("state"));
                vs.setLga(viewAllVaccinationSiteResult.getString("lga"));
                vs.setName(viewAllVaccinationSiteResult.getString("name"));
                vs.setAddress(viewAllVaccinationSiteResult.getString("address"));
                vs.setCapacity(viewAllVaccinationSiteResult.getString("site_capacity"));
                vs.setVaccineAvailable(viewAllVaccinationSiteResult.getString("vaccine_available"));

                result.add(vs);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return result;
    }

    public String[] viewPatientInformation(String patient_id) throws ClassNotFoundException {

        Patient p = new Patient();

        String patientID = "";
        String firstName = "";
        String middleName = "";
        String lastName = "";
        String email = "";
        String phone = "";
        String dobKnown = "";
        String dob = "";
        String age = "";
        String date = "";
        String sex = "";
        String address = "";
        String city = "";
        String zip = "";

        try {

            String sql = "SELECT * FROM patient_information where email = '" + patient_id + "'";

            connectToDataBase();

            viewPatientInformation = connection.createStatement();

            viewPatientInformationResult = viewPatientInformation.executeQuery(sql);

            viewPatientInformationResult.next();

            patientID = viewPatientInformationResult.getString("patient_id");
            firstName = viewPatientInformationResult.getString("first_name");
            middleName = viewPatientInformationResult.getString("middle_name");
            lastName = viewPatientInformationResult.getString("last_name");
            email = viewPatientInformationResult.getString("email");
            phone = viewPatientInformationResult.getString("phone");
            dobKnown = viewPatientInformationResult.getString("dob_known");
            dob = viewPatientInformationResult.getString("dob");
            age = viewPatientInformationResult.getString("age");
            date = viewPatientInformationResult.getString("date");
            sex = viewPatientInformationResult.getString("sex");
            address = viewPatientInformationResult.getString("address");
            city = viewPatientInformationResult.getString("city");
            zip = viewPatientInformationResult.getString("zip");

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return new String[]{patientID, firstName, middleName, lastName, email, phone, address, dobKnown, dob,
            age, date, sex, city, zip};
    }
    
    public String[] viewHealthInformation(String patient_id) throws ClassNotFoundException {

        HealthInformation hi = new HealthInformation();

        String healthInfoID = "";
        String patientID = "";
        String knownMedicalCondition = "";
        String medicalCondition = "";
        String feelingSick = "";
        String immunoCompromised = "";
        String previousDose = "";

        try {

            String sql = "SELECT * FROM health_information where patient_id = '" + patient_id + "'";

            connectToDataBase();

            viewHealthInformation = connection.createStatement();

            viewHealthInformationResult = viewHealthInformation.executeQuery(sql);

            viewHealthInformationResult.next();

            patientID = viewHealthInformationResult.getString("patient_id");
            healthInfoID = viewHealthInformationResult.getString("first_name");
            knownMedicalCondition = viewHealthInformationResult.getString("middle_name");
            medicalCondition = viewHealthInformationResult.getString("last_name");
            feelingSick = viewHealthInformationResult.getString("email");
            immunoCompromised = viewHealthInformationResult.getString("phone");
            previousDose = viewHealthInformationResult.getString("dob_known");
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return new String[]{patientID, healthInfoID, knownMedicalCondition, medicalCondition, feelingSick, immunoCompromised, previousDose};
    }
    
    public String[] viewSchedulingInformation(String patient_id) throws ClassNotFoundException {

        SchedulingInformation s = new SchedulingInformation();

        String schedulingID = "";
        String patientID = "";
        String healthFacilityType = "";
        String stateForVaccination = "";
        String lgaForVaccination = "";
        String preferredDate = "";
        String firstDose = "";
        String firstDoseDate = "";
        String firstDoseSite = "";
        String secondDose = "";
        String secondDoseDate = "";
        String secondDoseSite = "";
        String vaccinationStatus = "";

        try {

            String sql = "SELECT * FROM scheduling_information where patient_id = '" + patient_id + "'";

            connectToDataBase();

            viewSchedulingInformation = connection.createStatement();

            viewSchedulingInformationResult = viewSchedulingInformation.executeQuery(sql);

            viewSchedulingInformationResult.next();

            patientID = viewSchedulingInformationResult.getString("patient_id");
            schedulingID = viewSchedulingInformationResult.getString("scheduling_id");
            healthFacilityType = viewSchedulingInformationResult.getString("health_facility_type");
            stateForVaccination = viewSchedulingInformationResult.getString("state_for_vaccination");
            lgaForVaccination = viewSchedulingInformationResult.getString("lga_for_vaccination");
            preferredDate = viewSchedulingInformationResult.getString("preferred_date");
            firstDose = viewSchedulingInformationResult.getString("first_dose");
            firstDoseDate = viewSchedulingInformationResult.getString("first_dose_date");
            firstDoseSite = viewSchedulingInformationResult.getString("first_dose_site");
            secondDose = viewSchedulingInformationResult.getString("second_dose");
            secondDoseDate = viewSchedulingInformationResult.getString("second_dose_date");
            secondDoseSite = viewSchedulingInformationResult.getString("second_dose_site");
            vaccinationStatus = viewSchedulingInformationResult.getString("vaccination_status");

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return new String[]{patientID, schedulingID, healthFacilityType, stateForVaccination, lgaForVaccination, 
            preferredDate, firstDose,firstDoseDate,firstDoseSite,secondDose,secondDoseDate,secondDoseSite,vaccinationStatus};
    }
    
    public String[] viewAppointmentInformation(String patient_id) throws ClassNotFoundException {

        String appointmentID = "";
        String siteID = "";
        String patientID = "";
        String dose = "";
        String appointmentDate = "";
        String appointmentTime = "";

        try {

            String sql = "SELECT * FROM appointment where patient_id = '" + patient_id + "'";

            connectToDataBase();

            viewAppointmentInformation = connection.createStatement();

            viewAppointmentInformationResult = viewAppointmentInformation.executeQuery(sql);

            viewAppointmentInformationResult.next();

            patientID = viewAppointmentInformationResult.getString("patient_id");
            appointmentID = viewAppointmentInformationResult.getString("appointment_id");
            siteID = viewSchedulingInformationResult.getString("site_id");
            dose = viewSchedulingInformationResult.getString("dose");
            appointmentDate = viewSchedulingInformationResult.getString("appointment_date");
            appointmentTime = viewSchedulingInformationResult.getString("appointment_time");
            

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return new String[]{patientID, appointmentID, siteID,dose,appointmentDate, appointmentTime};
    }
    
    public void deleteUserByAdmin(String userID) throws ClassNotFoundException{
        
        try {
            
            String sql = "DELETE FROM user where email = '"+userID+"'";
            
            connectToDataBase();
            
            deleteUser = connection.createStatement();
            
            deleteUser.executeUpdate(sql);
            
         }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }
    
    public String getVaccineBalance(String site_id) throws ClassNotFoundException{
        
        String vaccine_available = "";
        
         try {
             
            connectToDataBase(); 
            
            String sql = "SELECT vaccine_available FROM vaccination_site WHERE site_id = '"+site_id+"' ";
            
            getVaccineBalance = connection.createStatement();
            
            getVaccineBalanceResult = getVaccineBalance.executeQuery(sql);
            
            while (getVaccineBalanceResult.next()) {
                vaccine_available = getVaccineBalanceResult.getString("vaccine_available");
                
                System.out.println("vaccine_available is " + vaccine_available);
            }
             
         } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
        
        return vaccine_available;
    }
    
    public void updateVaccineCount(String site_id, String vaccine_available){
        
        try{
            
            connectToDataBase();
            
            String sql = "UPDATE vaccination_site SET  vaccine_available = '"+vaccine_available+"' WHERE  site_id = '"+site_id+"' ";
            
            updateVaccineCount = connection.prepareStatement(sql);
             
            updateVaccineCount.executeUpdate();
            
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public List<VaccinationSite> searchAvailableVaccinationSite(String health_facility_type, String state, String lga) throws ClassNotFoundException {

        List<VaccinationSite> result = new ArrayList();
        
        try {

            /**String sql = "SELECT * FROM vaccination_site WHERE health_facility_type = '"+health_facility_type+"' "
                    + "AND state = '"+state+"' AND lga = '"+lga+"'AND site_capacity > 0 AND vaccine_available > 0";**/
            
            String sql = "SELECT * FROM vaccination_site WHERE health_facility_type = '"+health_facility_type+"' "
                    + "AND state = '"+state+"' AND lga = '"+lga+"'";
            
            connectToDataBase();

            searchAvailableVaccinationSite = connection.createStatement();

            searchAvailableVaccinationSiteResult = searchAvailableVaccinationSite.executeQuery(sql);

            while (searchAvailableVaccinationSiteResult.next()) {

                VaccinationSite vs = new VaccinationSite();

                vs.setSiteID(searchAvailableVaccinationSiteResult.getString("site_id"));
                vs.setHealthFacilityType(searchAvailableVaccinationSiteResult.getString("health_facility_type"));
                vs.setState(searchAvailableVaccinationSiteResult.getString("state"));
                vs.setLga(searchAvailableVaccinationSiteResult.getString("lga"));
                vs.setName(searchAvailableVaccinationSiteResult.getString("name"));
                vs.setAddress(searchAvailableVaccinationSiteResult.getString("address"));
                vs.setCapacity(searchAvailableVaccinationSiteResult.getString("site_capacity"));
                vs.setVaccineAvailable(searchAvailableVaccinationSiteResult.getString("vaccine_available"));

                result.add(vs);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return result;
    }
    
    public int getTotalAppointmentForDate(String siteID, String preferredDate) throws ClassNotFoundException{
        
        int count = 0;
        
        try {
            
            connectToDataBase();
            
            String sql = "SELECT COUNT(appointment_date) FROM appointment WHERE site_id = '"+siteID+"' AND appointment_date = '"+preferredDate+"' ";
            
            getTotalAppointmentForDate = connection.createStatement();
            
            getTotalAppointmentForDateResult = getTotalAppointmentForDate.executeQuery(sql);
            
            while (getTotalAppointmentForDateResult.next()) {
                
                count = getTotalAppointmentForDateResult.getInt(1);
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return count;
        
    }
}
