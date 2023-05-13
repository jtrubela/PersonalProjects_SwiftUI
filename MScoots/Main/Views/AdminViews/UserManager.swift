//UserManagerView.swift

// temporary view allowing the user to see all the stored information in the studentUser and scooter firestore DB
// needs to be integrated into the main views for the admin to manage users/scooters and allow the user to store any information that should/could be updated by the user


//import Foundation
import SwiftUI
//import CoreLocation
//import FirebaseFirestore


struct UserManagerView: View {
    @ObservedObject var fmodel = Firebase_Firestore()

    func clear_studentUserTextFields(){
        // Clear the text fields
        fmodel.CWID = ""
        fmodel.email = ""
        fmodel.first_name = ""
        fmodel.last_name = ""
    }
    
    var body: some View {
        NavigationView{
            VStack {
                VStack{
                    Section{
                        
                        List{
                            ForEach(fmodel.list) { item in
                                NavigationLink("\(item.last_name), \(item.first_name)"){
                                    VStack{
                                        List{
                                            Section{
                                                Text("\(item.last_name), \(item.first_name)")
                                            }header:{
                                                Text("Name")
                                            }
                                            
                                            Section{
                                                Text(item.id)
                                            }header:{
                                                Text("Unique User ID(UUID)")
                                            }
                                            
                                            Section{
                                                Text(item.CWID)
                                            }header:{
                                                Text("CWID")
                                            }
                                            
                                            Section{
                                                Text(item.email)
                                            }header:{
                                                Text("Email")
                                            }
                                        }
                                        Text("\(item.last_name), \(item.first_name)")
                                        Text(item.CWID)
                                        Text(item.email)
                                    }
                                }
                            }
                        }.navigationBarTitle("UserManager")
                        
                    } header: {
                        Text("Student Users in DataBase").textCase(.none)
                    }
                }
            }
            .onAppear(perform: fmodel.getStudentData)
        }
    }
}



struct UserManagerView_Previews: PreviewProvider {
    static var previews: some View {
        UserManagerView()
    }
}



