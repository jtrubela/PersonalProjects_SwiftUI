//UserManagerView.swift

// temporary view allowing the user to see all the stored information in the studentUser and scooter firestore DB
// needs to be integrated into the main views for the admin to manage users/scooters and allow the user to store any information that should/could be updated by the user


//import Foundation
import SwiftUI
import CoreLocation
import FirebaseFirestore





struct UserManagerView: View {
    @ObservedObject var model = Firebase_Authorization()
    @ObservedObject var Firestore = Firebase_Firestore()
    @State var list = [studentUser]()
    
    
    @State var CWID = ""
    @State var email = ""
    @State var first_name = ""
    @State var last_name = ""
    
    func clear_studentUserTextFields(){
        // Clear the text fields
        CWID = ""
        email = ""
        first_name = ""
        last_name = ""
    }
    
   
   
    
    var body: some View {
        NavigationView{
            VStack {
                VStack{
                    Section{
                        
                        List{
                            ForEach(Firestore.list) { item in
                                
                                
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
                                        }
                                        Text("\(item.last_name), \(item.first_name)")
                                        Text(item.CWID)
                                        Text(item.email)
                                    }
                                }
                            }
                            //TODO: Figure out why this is causing Mesh Errors
                            //                                .onDelete(perform: delete)
                            //
                        }.navigationBarTitle("UserManager")
                        
                    } header: {
                        Text("Student Users in DataBase").textCase(.none)
                    }
                    
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
                }
                
                
                
            }
            .onAppear(perform: Firestore.getStudentData)
        }
    }
    
}



struct UserManagerView_Previews: PreviewProvider {
    static var previews: some View {
        UserManagerView()
    }
}



