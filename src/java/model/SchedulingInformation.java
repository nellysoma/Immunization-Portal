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
public class SchedulingInformation {
    
    private String schedulingID;
    private String patientID;
    private String healthFacilityType;
    private String stateForVaccination;
    private String lgaForVaccination;
    private String preferredDate;
    private String firstDose;
    private String firstDoseDate;
    private String firstDoseSite;
    private String secondDose;
    private String secondDoseDate;
    private String secondDoseSite;
    private String vaccinationStatus;
    
}
