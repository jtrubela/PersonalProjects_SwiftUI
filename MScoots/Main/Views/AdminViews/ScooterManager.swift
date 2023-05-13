//
//  ScooterManagerView.swift
//  MScoots
//
//  Created by Justin Trubela on 4/12/23.
//

import SwiftUI

struct ScooterManagerView: View {
    let firestore = FirebaseManager.shared.firestore
    
    @ObservedObject var model = Firebase_Firestore()

    func clear_scooterTextFields() {
        // Clear the text fields
        model.ScooterID = ""
        model.isAvailable = "1"
        model.battery = "battery.100"
        model.nearestCharger = "Blue"
        model.location = "CCIS"
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Section{
                    List {
                        ForEach(model.Scoot_list) { scoot in
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
                                                Text("\(String(scoot.battery.suffix(3)))%")
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
                                                    model.deleteScoot(ScooterID: scoot.ScooterID)
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
                            TextField("ScooterID", text: $model.ScooterID)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        //Battery Selection
                        Section{
                            HStack{
                                Text("Selected battery: \(Image(systemName: model.battery))")
                                Spacer()
                                
                                Picker("Select a battery image", selection: $model.battery) {
                                    ForEach(model.scooterBattery, id: \.self) {
                                        Image(systemName: $0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.padding(.horizontal)
                        }
                        
                        //isAvaialable Selection
                        Section{
                            HStack{
                                if model.isAvailable == "1" {
                                    Text("Selected availability: Available")
                                }
                                else if model.isAvailable == "0"{
                                    Text("Selected availability: Far but Available")
                                }
                                else if model.isAvailable == "-1"{
                                    Text("Selected availability: Unavailable")
                                }
                                Spacer()
                                
                                
                                Picker("Select an availability", selection: $model.isAvailable) {
                                    ForEach(model.scooterAvailability, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.padding(.horizontal)
                        }
                        
                        //Location Selection
                        Section{
                            HStack{
                                Text("Selected location: \(model.location)")
                                Spacer()
                                Picker("Select an availability", selection: $model.location) {
                                    ForEach(model.locations, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                            }.padding(.horizontal)
                        }
                        
                        //Charger Selection
                        Section{
                            HStack{
                                Text("Selected charger: \(model.nearestCharger)")
                                Spacer()
                                Picker("Select an availability", selection: $model.nearestCharger) {
                                    ForEach(model.scooterChargers, id: \.self) {
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
                        model.addScootData(ScooterID: model.ScooterID,
                                               location: model.location,
                                               isAvailable: model.isAvailable,
                                               battery: model.battery,
                                               nearestCharger: model.nearestCharger)
                        
                        clear_scooterTextFields()
                        
                    } label:{
                        Text("Add/Update Scooter")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .onAppear(perform: model.getScootData)
        }
    }
    
}

struct ScooterManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterManagerView()
    }
}
