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
public class HealthInformation {
    
    private String healthInfoID;
    private String patientID;
    private String knownMedicalCondition;
    private String medicalCondition;
    private String feelingSick;
    private String immunoCompromised;
    private String previousDose;
}
