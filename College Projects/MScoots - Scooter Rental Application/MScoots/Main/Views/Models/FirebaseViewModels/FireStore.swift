//
//  Firebase_Firestore.swift
//  MScoots
//
//  Created by Justin Trubela on 2/19/23.
//
//  Firebase_Firestore represents the link between data being saved from the application to the database(Firestore)
//      -can be accessed using the ObservableObject property wrapper by any view.
//      -Represents students data that is saved to the database and allows the user to store any information that should/could be updated:
//          studentUser()
//      -Represents scooter data that is saved to the database
//          Scooter()
//
//      -called by setting a variable as:
//          @ObservedObject var Firestore = Firebase_Firestore()
//
//      -Create a studentUser item for each document returned:
//           Scooter(location: <#T##String#>, isAvailable: <#T##String#>, battery: <#T##String#>, nearestCharger: <#T##String#>)
//
//
//      -Functions currently used
//          -addData:
//          -getData:
//          -addScootData:
//          -


import Foundation
import Firebase

class Firebase_Firestore: ObservableObject {
    let firebase = FirebaseManager.shared.firestore
    
    @Published var list = [studentUser]()
    
    @Published var CWID = ""
    @Published var email = ""
    @Published var first_name = ""
    @Published var last_name = ""
    
    
    
    //add func for studentUser list
    func addData(CWID: String, email: String, first_name: String, last_name: String) {
        
        // Get a reference to the database
        let db = firebase
        
        // Add a document to a collection
        db.collection("studentUser").document(CWID).setData(["CWID":CWID, "email":email, "first_name":first_name,"last_name":last_name]) { error in            
            
            // Check for errors
            if error == nil {
                
                // No errors
                // Call get data to retrieve latest data
                self.getStudentData()
            }
            else {
                // Handle the error
            }
        }
    }
    //get func for studentUser list
    func getStudentData() {
        
        // Get a reference to the database
        let db = firebase

        // Read the documents at a specific path
        db.collection("studentUser").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                
                // No errors
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create studentUsers
                        self.list = snapshot.documents.map { d in
                            
                            return studentUser(
                                CWID: d["CWID"] as? String ?? "",
                                email: d["email"] as? String ?? "",
                                first_name: d["first_name"] as? String ?? "",
                                last_name: d["last_name"] as? String ?? "")
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @Published var Scoot_list = [Scooter]()

    @Published var ScooterID = "Scooter 00"
    
    
    
    @Published var scooterBattery =
    [
        "battery.0",    //battery   0% image
        "battery.25",   //battery  25% image
        "battery.50",   //battery  50% image
        "battery.75",   //battery  75% image
        "battery.100",  //battery 100% image
    ]
    @Published var battery = "battery.100"
    
    
    
    
    @Published var scooterAvailability =
    [
        "1",  //Available -             Green
        "0",  //Available but far -     Yellow
        "-1", //Unavailable -           Red
    ]
    @Published var isAvailable = "1"
    
    
    
    @Published var locations = ["CCIS", "Yogi Berra", "Blanton Hall", "Life Hall", "Car Parc Diem", "The Overview","University Hall"]
    @Published var location = "CCIS"
    
    
    @Published var scooterChargers =
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
    @Published var nearestCharger = "Blue"
    
    
    
    
    
    
    
    
    
    
    
    
    //add/update func for scooter list
    func addScootData(ScooterID: String, location: String, isAvailable: String, battery: String, nearestCharger: String){
        
        // Get a reference to the database
        let db = firebase

        // Add a document to a collection
        db.collection("scooter_list").document(ScooterID).setData(["ScooterID":ScooterID, "isAvailable":isAvailable, "battery":battery, "nearestCharger":nearestCharger,"location":location])
        {
            error in
            
            
            // Check for errors
            if error == nil {
                print ("No data found")
                // No errors
                // Call get data to retrieve latest data
                self.getScootData()
            }
            else {
                // Handle the error
                print ("Error")
            }
        }
    }
    //TODO: DELETE scooter data - DELETE/ADD ANY OTHER INFORMATION
    func deleteScoot(ScooterID: String) {
        
        // Get a reference to the database
        let db = firebase

        
        // Specify the document to delete
        db.collection("scooter_list").document(ScooterID).delete { error in
            
            // Check for errors
            if error == nil {
                // No errors
                print("No errors")
                
                // Update the UI from the main thread
                //                    DispatchQueue.main.async {
                //
                //                        // Remove thestudentUser that was just deleted
                ////                        self.list.removeAll { studentUser in
                ////
                ////                            // Check for thestudentUser to remove
                ////                            //return studentUser.id == studentUserToDelete.id
                ////                        }
                //                    }
                
                
            } else {
                print ("Damnmmmmmmmm")
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    @Published var history_list = [HistoryItem]()

    
    // History of scooter rides
    // Get history data for a specific scooter
    func getHistoryData() {
        
        // Get a reference to the database
        let db = firebase

        // Read the documents at a specific path
        db.collection("History").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                
                // No errors
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create studentUsers
                        self.history_list = snapshot.documents.map { d in
                            
                            return HistoryItem(ScooterID: d["ScooterID"] as? String ?? "",
                                               location: d["location"] as? String ?? "",
                                               Charger: d["Charger"] as? String ?? "",
                                               DateStart: d["DateStart"] as? String ?? "",
                                               DateEnd: d["DateEnd"] as? String ?? ""
                            )
                            
                            
                            
                        }
                        
                    }
                }
            }
        }
    }

    
    
    
    
    
    
    //get func for scooter list
    func getScootData() {
        
        // Get a reference to the database
        let db = firebase

        // Read the documents at a specific path
        db.collection("scooter_list").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                
                // No errors
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create studentUsers
                        self.Scoot_list = snapshot.documents.map { d in
                            
                            return Scooter(
                                ScooterID: d["ScooterID"] as? String ?? "",
                                location: d["location"] as? String ?? "",
                                isAvailable: d["isAvailable"] as? String ?? "",
                                battery: d["battery"] as? String ?? "",
                                nearestCharger: d["nearestCharger"] as? String ?? ""
                            )
                            
                        }
                        
                    }
                }
            }
        }
    }
}


struct HistoryItem : Identifiable {
    var id = NSUUID().uuidString
    var ScooterID: String
    var location: String
    var Charger: String
    var DateStart: String
    var DateEnd: String
    
    init(id: String = UUID().uuidString, ScooterID: String, location: String, Charger: String, DateStart: String, DateEnd: String){
        self.id = NSUUID().uuidString
        self.ScooterID = ScooterID
        self.location = location
        self.Charger = Charger
        self.DateStart = DateStart
        self.DateEnd = DateEnd
        
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


//Button{
//Firestore.deleteUser(CWID: item.CWID)
//}label:{
//HStack{
//Image(systemName: "trash")
//Text("Delete User")
//}
//}
//Section{
//Text(item.password)
//}header:{
//Text("Password")
//}




//                                            Section{
////                                                 studentUser entry fields
//
//                                                TextField("CWID", text: $CWID)
//                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                                                TextField("email", text: $email)
//                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                                                TextField("first_name", text: $first_name)
//                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                                                TextField("last_name", text: $last_name)
//                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//
//                                                Button{
//                                                    // Call add data
//                                                    Firestore.addData(CWID: CWID, email: email, first_name: first_name, last_name: last_name)
//
//                                                    // Clear the text fields
//                                                    clear_studentUserTextFields()
//
//                                                }label:{
//                                                    Text("Add New Student Item")
//                                                }.buttonStyle(.borderedProminent)
//
//                                            }
