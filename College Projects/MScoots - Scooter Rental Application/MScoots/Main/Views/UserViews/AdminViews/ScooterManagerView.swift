//
//  ScooterManagerView.swift
//  MScoots
//
//  Created by Justin Trubela on 4/12/23.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseStorage
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct ScooterManagerView: View {
    let firestore = FirebaseManager.shared.firestore
    
    //    @ObservedObject var model = Firebase_Authorization()
    
    
    @ObservedObject var Firestore = Firebase_Firestore()
    @State var scooter_list = [Scooter]()

    @State var ScooterID = "Scooter 00"
    
    
    
    let scooterBattery =
    [
        "battery.0",    //battery   0% image
        "battery.25",   //battery  25% image
        "battery.50",   //battery  50% image
        "battery.75",   //battery  75% image
        "battery.100",  //battery 100% image
    ]
    @State var battery = "battery.100"

    
    
    
    let scooterAvailability =
    [
        "1",  //Available -             Green
        "0",  //Available but far -     Yellow
        "-1", //Unavailable -           Red
    ]
    @State var isAvailable = "1"
    
    
    
    let locations = ["CCIS", "Yogi Berra", "Blanton Hall", "Life Hall", "Car Parc Diem", "The Overview","University Hall"]
    @State var location = "CCIS"

    
    let scooterChargers =
    [
        "Green",    //
        "Yellow",   //
        "Red",      //
        "Blue",     //
        "Black",    //
        "Pink",     //
        "Orange",   //
        "Purple",   //
        "Brown",    //
    ]
    @State var nearestCharger = "Blue"
    
    func clear_scooterTextFields() {
        // Clear the text fields
        ScooterID = ""
        isAvailable = "1"
        battery = "battery.100"
        nearestCharger = "Blue"
        location = "CCIS"
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Section{
                    
                    List {
                        ForEach(Firestore.Scoot_list) { scoot in
                            NavigationLink("\(String(scoot.ScooterID))") {
                                
                                VStack{
                                    Text("Scooter")
                                    VStack{
                                        List{
                                            Section{
                                                Text("\(scoot.ScooterID)")
                                            } header: {
                                                Text("ID:").bold()
                                            }
                                            Section{
                                                Text("\(scoot.isAvailable)")
                                            } header: {
                                                Text("isAvailable")
                                            }
                                            Section{
                                                Text("\(String(scoot.battery.suffix(2)))%")
                                            } header: {
                                                Text("Battery:").bold()
                                            }
                                            Section{
                                                Text("\(scoot.location)")
                                            } header: {
                                                Text("Nearest Location")
                                            }
                                            Section{
                                                Text("\(scoot.nearestCharger)")
                                            } header: {
                                                Text("Charger:").bold()
                                            }
                                            Section{
                                                Button{
                                                    Firestore.deleteScoot(ScooterID: scoot.ScooterID)
                                                }label:{
                                                    HStack{
                                                        Image(systemName: "trash")
                                                        Text("Delete Scooter")
                                                        
                                                    }
                                                }
                                            }
                                        }
                                        
                                    }
                                    
                                }
                            }
                            
                        }
                    }.navigationBarTitle("Scooter Manager")
                    
                } header: {
                    Text("Scooter data in DataBase").textCase(.none)
                }
                //Add/Update Scooter
                Section{
                    VStack{
                        //ScooterID text entry field
                        Section{
                            TextField("ScooterID", text: $ScooterID)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        //Battery Selection
                        Section{
                            HStack{
                                Text("Selected battery: \(Image(systemName: battery))")
                                Spacer()
                                
                                Picker("Select a battery image", selection: $battery) {
                                    ForEach(scooterBattery, id: \.self) {
                                        Image(systemName: $0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.padding(.horizontal)
                        }
                        
                        //isAvaialable Selection
                        Section{
                            HStack{
                                if isAvailable == "1" {
                                    Text("Selected availability: Available")
                                }
                                else if isAvailable == "0"{
                                    Text("Selected availability: Far but Available")
                                }
                                else if isAvailable == "-1"{
                                    Text("Selected availability: Unavailable")
                                }
                                Spacer()
                                
                                
                                Picker("Select an availability", selection: $isAvailable) {
                                    ForEach(scooterAvailability, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.padding(.horizontal)
                        }
                        
                        //Location Selection
                        Section{
                            HStack{
                                Text("Selected location: \(location)")
                                Spacer()
                                Picker("Select an availability", selection: $location) {
                                    ForEach(locations, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.padding(.horizontal)
                        }
                        
                        //Charger Selection
                        Section{
                            HStack{
                                Text("Selected charger: \(nearestCharger)")
                                Spacer()
                                Picker("Select an availability", selection: $nearestCharger) {
                                    ForEach(scooterChargers, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.padding(.horizontal)
                        }
                        
                    }
                    
                    
                    
                    //Scoooter list items button
                    Button{
                        // Call add data
                        Firestore.addScootData(ScooterID: ScooterID,
                                               location: location,
                                               isAvailable: isAvailable,
                                               battery: battery,
                                               nearestCharger: nearestCharger)
                        
                        clear_scooterTextFields()
                        
                    } label:{
                        Text("Add/Update Scooter")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .onAppear(perform: Firestore.getScootData)
        }
    }
    
}

struct ScooterManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterManagerView()
    }
}


//Scooter Onject instantiator
//takes in the systems current data from the random Location/Scooter attribute/and scooter status to use to locate these scooters on the scooterlist system
//var scooters: [Scooter] =
//[
//    Scooter(location: "Computer Science Building", isAvailable: "Unavailable", battery: "Charged", nearestCharger: "Black", currentUser: studentUser(CWID: "21622025", email: "trubelaj1@montclair.edu", first_name: "Justin", last_name: "Trubela", password: "Password!123")),
////    Scooter(location: randomLocation, isAvailable: "2", battery: randomBatteryStatus, nearestCharger: randomChargingStation),
//]
//
//


