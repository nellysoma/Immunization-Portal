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
public class Patient {
    
    private String patientID;
    private String firstName;
    private String middleName;
    private String lastName;
    private String email;
    private String phone;
    private String dobKnown;
    private String dob;
    private String age;
    private String date;
    private String sex;
    private String address;
    private String city;
    private String zip;
}
