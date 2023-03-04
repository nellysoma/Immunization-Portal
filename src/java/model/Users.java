/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Harmony
 */

@Getter
@Setter
public class Users {
    
    private String user_id;
    private String userName;
    private String password;
    private String email;
    private String phone;
    private String role;
    private String firstName;
    private String lastName;
}
