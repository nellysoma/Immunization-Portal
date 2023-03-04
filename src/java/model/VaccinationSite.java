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
public class VaccinationSite {
    
    private String siteID;
    private String healthFacilityType;
    private String state;
    private String lga;
    private String name;
    private String address;
    private String capacity;
    private String vaccineAvailable;
}
