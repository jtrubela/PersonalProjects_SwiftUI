//
//  AdminUserHomeView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

//firestore
//https://firebase.google.com/docs/firestore?authuser=0#implementation_path

import SwiftUI

struct AdminUserHomeView: View{
    
    
    
    //Grab the state of the Navigation class using the Hashable protocol
//    @ObservedObject var model = Firebase_Authorization()
    @ObservedObject var model = Firebase_Firestore()
    //Make an instance of the NavigationStack that has an array of hashable ites

    var body: some View {
        //Navigates to a buttons location
        ZStack{
            //            NavigationStack(path: [AnyView?])
            Color.yellow.ignoresSafeArea()
            VStack{
                VStack{
                    HStack{
                        //Title - Done
                        Section{
                            //TODO: Titles
                            Text("ADMIN HOME")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .padding(.leading, 30)
                        }
                        Spacer()
                        //Logout Button - Undone
                        Section{
                            
                            NavigationLink(destination: LandingPageView()) {
                                HStack{
                                    Image(systemName: "figure.wave")
                                    Text("Log Out")
                                }
                            }.buttonStyle(.borderedProminent).padding(.trailing, 10)
                            
                        }
                        
                    }
                    Spacer()
                    
                    //Admin Utilities
                    // Admin Scooter Lists - Undone
                    Section{
                        VStack{
                            List{
                                //Sections
                                Section{
                                    //TODO: Show random scooters
                                    ForEach(model.Scoot_list.filter{ $0.isAvailable
                                        == "1" }){ scooter in
                                            Text(scooter.ScooterID)
                                        }
                                }
                            header: {
                                Text("Available Scooters")
                            }
                                Section{
                                    //TODO: Show random scooters
                                    ForEach(model.Scoot_list.filter{ $0.isAvailable == "0"}){ scooter in
                                        Text(scooter.ScooterID)
                                    }
                                }
                            header: {
                                Text("Unavailable Scooters in-Use")
                            }
                                Section{
                                    //TODO: Show random scooters
                                    ForEach(model.Scoot_list.filter{ $0.isAvailable == "-1"}){ scooter in
                                        Text(scooter.ScooterID)
                                    }
                                }
                            header: {
                                Text("Scooters offline")
                            }
                            }
                            .listStyle(.sidebar)
                        }
                        .scrollIndicators(.visible)
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                    
                    //STACK 1.2 -- Admim Buttons
                    //Access to user views
                    VStack{
                        //Toolbar Button - ScooterMGR/UserMGR Navigation
                        //UNDONE
                        Section{
                            HStack{
                                //ScooterManagerButton
                                Section{
                                    NavigationLink(destination: ScooterManagerView()) {
                                        VStack {
                                            ScooterMGRButton()
                                        }
                                        .frame(width: 180, height: 200)
                                    }
                                }
                                //UserManagerButton
                                Section{
                                    
                                    NavigationLink(destination: UserManagerView()) {
                                        VStack {
                                            UserMGRButton()
                                        }
                                        .frame(width: 180, height: 200)
                                    }
                                }
                                .navigationBarBackButtonHidden(false)
                            }
                        }
                    }
                    .onAppear(
                        perform: model.getScootData
                    )
                }
            }
        }
    }
}

 
struct AdminUserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AdminUserHomeView()
        }
    }
}



struct ScooterMGRButton: View{

    var body: some View {
        VStack {
            Image(systemName: "scooter")
                .font(.system(size: 90))
            Text("Scooter Manager!")
                .foregroundColor(.black)
        }
        .frame(width: 180, height: 200)
    }
}

struct UserMGRButton: View{

    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    .font(.system(size: 90))
                Text("UserManager")
                    .foregroundColor(.black)
            }.frame(width: 180, height: 200)
        }
    }
}


//Home
struct HomeButton: View {
    var body: some View {
        HStack{
            Image(systemName: "house.fill")
            Text("Home")
        }
        .font(.system(size: 30))
        .buttonStyle(.bordered)
    }
}

//Scooter
struct ScooterButton: View {
    var body: some View {
        HStack{
            Image(systemName: "scooter")
            Text("My Scooter").underline()
        }
        .font(.system(size: 30))
        .buttonStyle(.bordered)
    }
}
//

//Wallet
struct WalletButton: View {
    var body: some View {
        HStack{
            Image(systemName: "creditcard.fill")
            Text("My Wallet").underline()
        }
        .font(.system(size: 30))
    }
}
