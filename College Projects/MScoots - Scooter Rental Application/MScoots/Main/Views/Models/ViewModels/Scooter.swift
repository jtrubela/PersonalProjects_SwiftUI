//
//  Scooter.swift
//  MScoots
//
//  Created by Justin Trubela on 3/26/23.
//

import Foundation
import SwiftUI

//create a scooter object so that the user can find them
//  rent/return, admin can add and delete items
struct Scooter: Identifiable {
    //conform the object to Identifiable so that we can do a thorough search for
    // and have complete control over the scooter objects
    var id = NSUUID().uuidString
    //location is shown to the user when looking for scoothers to rent
    //admin will have the option to change and update these locations
    var ScooterID: String
    //varibale describing the loaction
    var location: String
    //this variable determines if the scooter is ready for the user to come and get it
    //checks against battery status, any support/service tickets have been submitted,
    //and if its in the general vecinity
    var isAvailable: String
    //shows the user the battery status for the scooter
    var battery: String
    //unused
    var nearestCharger: String
    var currentUser: studentUser? = nil
    
    
    init(id: String = UUID().uuidString, ScooterID: String, location: String, isAvailable: String, battery: String, nearestCharger: String, currentUser: studentUser? = nil) {
        self.id = id
        self.ScooterID = ScooterID
        self.location = location
        self.isAvailable = isAvailable
        self.battery = battery
        self.nearestCharger = nearestCharger
        self.currentUser = currentUser
    }
    
    
    struct ScooterInfo: Identifiable {
        var id = UUID()
        var scooterNumber: Int
        
        var model: String
        var year: String
        
    }
}
