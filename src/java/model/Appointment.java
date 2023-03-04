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
public class Appointment {
    
    private String appointmentID;
    private String siteID;
    private String patientID;
    private String dose;
    private String appointmentDate;
    private String appointmentTime;
}
