/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Harmony
 */
public class LoginRouterController extends HttpServlet {

   
   protected void loginRouter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        
        try {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            DbConnection user_login = new DbConnection();
            
            String[] user_details = user_login.userLogin(username, password);
            
            String user_password = user_details[0];
            String firstName = user_details[1];
            String lastName = user_details[2];
            String username1 = user_details[3];
            String user_role = user_details[4];
            String profile_pic = user_details[5];
            
            System.out.println("user name is " + username1);
            System.out.println("Password is: " + user_password);
            
            String[] sessionData = {username1, firstName, lastName,profile_pic};
            
            //check if fetched username is empty
            if (username1.isEmpty()) {

                RequestDispatcher rd1 = request.getRequestDispatcher("/wrongLoginCredentials.jsp");

                rd1.forward(request, response);
            }else {
                
                int result;

                result = user_login.checkUsernameEntry(username);
                
                //check if username is in database
                if (result == 1) {
                    
                    System.out.println("username is in database");//username is in database
                    
                    //check password
                    if (password.equals(user_password)) {
                        
                        System.out.println("password matches");//password matches
                        
                        //check if role is admin
                        if (user_role.equals("admin")) {
                            
                            request.setAttribute("sessionData", sessionData);
                            
                            RequestDispatcher rd2 = request.getRequestDispatcher("/AdministratorController?admin_action=administratorLogin");

                            rd2.forward(request, response);
                        
                        }
                        
                        //check if role is user
                        if (user_role.equals("user")) {
                            
                            request.setAttribute("sessionData", sessionData);
                            
                            RequestDispatcher rd2 = request.getRequestDispatcher("/UserController?user_action=userLogin");

                            rd2.forward(request, response);
                        }
                        
                        
                    }else {
                        
                        System.out.println("password does not match");//password does not match

                        RequestDispatcher rd3 = request.getRequestDispatcher("/wrongLoginCredentials.jsp");

                        rd3.forward(request, response);
                    }
                }else{
                    
                        System.out.println("username is not in database");//username is not in database

                        RequestDispatcher rd4 = request.getRequestDispatcher("/wrongLoginCredentials.jsp");

                        rd4.forward(request, response);
                } 
            }
            
        }catch (Exception error) {

            error.printStackTrace();
        }
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
        
          String login_action = request.getParameter("login_action");

            switch (login_action) {

                case "loginRouter":
                    loginRouter(request, response);
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
